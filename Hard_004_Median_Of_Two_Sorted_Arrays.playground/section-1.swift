/*

https://oj.leetcode.com/problems/median-of-two-sorted-arrays/

#4 Median of Two Sorted Arrays

Level: hard

There are two sorted arrays A and B of size m and n respectively. Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).

Inspired by @MissMary at https://oj.leetcode.com/discuss/15790/share-my-o-log-min-m-n-solution-with-explanation

*/

// O (log(min(m, n)))
func median2(a: [Int], b: [Int]) -> Double {
    var m = count(a)
    var n = count(b)

    if m > n {
        return median2(b, a)
    }

    var iMin = 0, iMax = m
    while iMin <= iMax {
        var i = (iMin + iMax) >> 1
        var j = ((m + n + 1) >> 1) - i
        if j > 0 && i < m && b[j-1] > a[i] {
            iMin = i + 1
        } else if i > 0 && j < n && a[i-1] > b[j] {
            iMax = i - 1
        } else {
            var num1: Int
            if i == 0 {
                num1 = b[j-1]
            }
            else if j == 0 {
                num1 = a[i-1]
            }
            else {
                num1 = max(a[i-1], b[j-1])
            }

            if (m+n) & 1 != 0 {
                return Double(num1)
            }

            var num2: Int
            if i == m {
                num2 = b[j]
            } else if j == n {
                num2 = a[i]
            } else {
                num2 = min(a[i], b[j])
            }

            return Double((num1 + num2))/2.0
        }
    }
    return 0.0
}

// test cases
median2([1, 2, 10], [30, 40, 50])   //20
median2([1], [1])   //1
median2([1, 2], [1])   //1
median2([1], [10, 20, 30])   //15
median2([1], [10, 20, 30, 40])   //20
median2([10, 20, 30], [10, 20, 30])   //20
median2([], [10, 20, 30])   //20

