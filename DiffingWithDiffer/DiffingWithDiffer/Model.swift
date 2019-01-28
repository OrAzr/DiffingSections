//
//  Model.swift
//  Diffing
//
//  Created by Or on 1/23/19.
//  Copyright © 2019 BankHapoalim. All rights reserved.
//

import Foundation

enum SectionKey:String {
    case top, bottom
}

protocol DiffableSection : Equatable  {
    associatedtype Items
    typealias ItemsArr = [Items]
    
    var items: ItemsArr? { get set }
    var sectionKey: String? { get set }
    init(with items:ItemsArr, sectionKey:String)
}


/////////////////////////////////////////////////////////
//////////////////  ** Sections ** //////////////////////
/////////////////////////////////////////////////////////



class BaseSection<U: Equatable> : DiffableSection{
    var items: [U]?
    var sectionKey: String?
    
    static func == (lhs: BaseSection, rhs: BaseSection) -> Bool {
        return lhs.sectionKey == rhs.sectionKey
    }
    
    required init(with items:[U], sectionKey:String){
        self.items = items
        self.sectionKey = sectionKey
    }
}



extension BaseSection : Collection {
    typealias Element = ItemsArr.Element
    typealias Index = ItemsArr.Index
    
    var startIndex: Index { return self.items?.startIndex ?? 0}
    var endIndex: Index { return self.items?.endIndex ?? 0}
    
    subscript(index: Index) -> Element {
        get { return self.items![index] }
    }
    func index(after i:Index) -> Index {
        return self.items!.index(after: i)
    }
}


/////////////////////////////////////////////////////////
//////////////////  ** ITEMS **  ////////////////////////
/////////////////////////////////////////////////////////


class BaseItem : Equatable{
    var text:String?
    static func == (lhs: BaseItem, rhs: BaseItem) -> Bool {
        return lhs.text ?? "" == rhs.text ?? ""
    }
    
    required init(with text:String) {
        self.text = text
    }
}


class TopItem : BaseItem{
    static func == (lhs: TopItem, rhs: TopItem) -> Bool {
        return lhs.text ?? "" == rhs.text ?? ""
    }
}

class BottomItem: BaseItem{
    static func == (lhs: BottomItem, rhs: BottomItem) -> Bool {
        return lhs.text ?? "" == rhs.text ?? ""
    }
}
