class OptionalSample {
    func lastNumError() {
        let nums = [3, 4, 6]
        let lastNum = nums.last
        //let ans = lastNum *2 と書きたいが、オプショナルバリューのためエラーになる
        let ans = lastNum! * 2
        print(ans)
    }
}
