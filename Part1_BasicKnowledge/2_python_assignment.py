def majority_element(nums):
    nums.sort()
    mid_num = nums[len(nums) // 2]
    if nums.count(mid_num) > len(nums) // 2:
        return mid_num
    return None

# Testing
print(majority_element([3,7,3,3,7,3]))  # 3
print(majority_element([3,7,3,7,3,7]))  # None
print(majority_element([3,7,3,7,7,7]))  # 7