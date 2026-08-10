-- https://leetcode.com/problems/intersection-of-two-arrays-ii/description/

passesTests = verify [1,2,2,1] [2,2] [ 2, 2 ]
    && verify [4,9,5] [9,4,9,8,4] [4,9]

verify :: [ Int ] -> [ Int ] -> [ Int ] -> Bool
verify nums1 nums2 output = output == intersect nums1 nums2

intersect :: [ Int ] -> [ Int ] -> [ Int ]
intersect nums1 nums2 = [ a | a <- nums1, elem a nums2 ]