import AVFoundation

class CameraAuth {
    
    // 認証のステータス
    enum AuthorizedStatus {
        case authorized
        case notAuthorized
        case failed
    }
    
    var status: AuthorizedStatus = .notAuthorized
    
    func authorize(completion: @escaping(AuthorizedStatus) -> ()) -> () {
        switch AVCaptureDevice.authorizationStatus(for: AVMediaType.video) {
        case .notDetermined:
            // 初回起動時
            AVCaptureDevice.requestAccess(for: AVMediaType.video,
                                          completionHandler: { authorized in
                                            print("初回", authorized.description)
                                            if authorized {
                                                self.status = .authorized
                                                completion(.authorized)
                                            } else {
                                                self.status = .notAuthorized
                                                completion(.notAuthorized)
                                            }
                                          })
        case .restricted, .denied:
            self.status = .notAuthorized
            completion(.notAuthorized)
        case .authorized:
            self.status = .authorized
            completion(.authorized)
        @unknown default:
            self.status = .failed
            completion(.failed)
        }
    }
}

