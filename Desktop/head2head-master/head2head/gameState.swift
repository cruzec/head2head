//
//  data.swift
//  head2head
//
//  Created by John Lee on 12/12/17.
//  Copyright © 2017 John Lee. All rights reserved.
//

import Foundation


struct GameState {
    static var teamOne = ["name": "Team1", "points": "0"]
    static var teamTwo = ["name": "Team2", "points": "0"]
    static var turnNumber = 1
    static var sessionTimeout = false
    static var categoryPointer = 0
    
    
    static var categories = [
        "random": ["Elephant", "Cabin", "Princess", "Mug", "Ice Skating", "Cell Phone", "Candle", "Table", "Forest", "Rainbow", "Flowers", "Horse", "Trash Can", "Computer ", "Bed Frame","Sister ","Restuarant","Math ","Bird","Basketball","Castle ","Water Bottle ","Music ","Gorilla ","Mother","Truck","Tiger ","Board Games","Movies ","Cooking","Chocolate","Dog","Letter ","Light Bulb ","Deck of Cards","Star","Newspaper","Football","Highway","Triangle ","Clothes","Planets","TV Shows ","Chips ","Shoes","Hippo","Snowboard","Groceries ","Marker","Purple","Bow","Pillow","Candy","New Years","Party","Halloween","Cheers","Alcohol","Fun","Excerise","Gym","Shopping","Present ","Store","Train","Window ","Rain","Snow","Coffee ","Cookies","Ice Cream","Blue","Sky ","Paint","Glitter","Concert","Horse Racing","Gambling","Night Clubs","Desk ","Chalk Board","Commute","Broom", "Basket"]
    ]
}



