// 강의 목록

//url - 각 과목 코드
//name - 강의 이름

struct SubjectListResponse: Codable {
    struct Response: Codable {
        let name: String
        let url: String
    }
    let status: Int
    let message: String
    let reponse: [Response]
}
