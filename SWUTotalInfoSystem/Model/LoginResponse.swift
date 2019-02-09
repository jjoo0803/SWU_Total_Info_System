// 로그인

//value - 토큰 값
//drive_id - 로그인 할 때 마다 주어지는 id 값

struct LoginResponse: Codable {
    struct Response: Codable {
        let value: String
        let driveId: Int
        enum CodingKeys: String, CodingKey {
            case driveId = "drive_id"
            case value
        }
    }
    let status: Int
    let message: String
    let reponse: Response
}
