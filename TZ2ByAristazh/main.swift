//
//  main.swift
//  TZ2ByAristazh
//
//  Created by Yaroslav Monastyrev on 27.11.2021.
//

import Foundation

//Given an array, rotate the array to the right by k steps, where k is non-negative.
//
//Example 1:
//Input: nums = [1,2,3,4,5,6,7], k = 3
//Output: [5,6,7,1,2,3,4]
//Explanation:
//rotate 1 steps to the right: [7,1,2,3,4,5,6]
//rotate 2 steps to the right: [6,7,1,2,3,4,5]
//rotate 3 steps to the right: [5,6,7,1,2,3,4]
//Constraints:
// • 1 <= nums.length <= 105
// • -231 <= nums[i] <= 231 - 1
// • 1 <= k <= 105

//first solution
var nums = [1,2,3,4,5,6,7]
let k = 5

func rotate(_ nums: inout [Int], _ k: Int) {
    let lenth = nums.count
    let newArray = nums.dropLast(k)
    nums = Array(nums.dropFirst(lenth - k))
    nums.append(contentsOf: newArray)
}

rotate(&nums, k)

//second solution
var nums2 = [1,2,3,4,5,6,7]
let k2 = 3

func rotate2(_ nums: inout [Int], _ k: Int) {
    let lenth = nums.count
    for _ in 0..<k {
        let lastElement = nums[lenth - 1]
        for j in (1..<lenth).reversed() {
            nums[j] = nums[j - 1]
        }
        nums[0] = lastElement
    }
    
}

rotate2(&nums2, k2)

//not mine, from the internet, but very beautiful

var nums3 = [1,2,3,4,5,6,7]
let k3 = 5

func change(_ nums: inout [Int], _ low: Int, _ high: Int) {
    var low1 = low
    var high1 = high
    
    while low1 < high1 {
        (nums[low1], nums[high1]) = (nums[high1], nums[low1])
        
        low1 += 1
        high1 -= 1
    }
}

func rotate3(_ nums: inout [Int], _ k: Int) {
    let lenth = nums.count
    
    change(&nums, lenth - k, lenth - 1)
    change(&nums, 0, lenth - k - 1)
    change(&nums, 0, lenth - 1)
    
}

rotate3(&nums3, k3)

