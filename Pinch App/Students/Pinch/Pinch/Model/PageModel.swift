//
//  PageModel.swift
//  Pinch
//
//  Created by Taewon Yoon on 2023/08/26.
//

import Foundation

struct Page: Identifiable { // 각각의 다른 이미지들을 구별하기 위해서 사용되는 프로토콜이다.
    let id: Int // Identifiable 프로토콜을 사용하려면 고유의 구분할 수 있는 방법이 있어야한다.
    let imageName: String // 파일이름
}

extension Page {
    var thumbnailName: String {
        return "thumb-" + imageName
    }
}
