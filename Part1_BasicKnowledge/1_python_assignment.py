def longest_sequence_intersection(list1, list2):

    # find common number
    common = []

    for num in list1:
        if num in list2:
            common.append(num)

    # find longest sequence

    longest = []

    current = []

    for num in common:

        if current == []:
            current.append(num)

        elif num == current[-1] + 1:
            current.append(num)

        else:
            if len(current) > len(longest):
                longest = current

            current = [num]

    # final check
    if len(current) > len(longest):
        longest = current

    if longest:
        return longest
    else:
        return None


list1 = [3,7,3,1,2,6,8,5,6,7]
list2 = [1,2,5,6,7]
list3 = [0,4,9]

print(longest_sequence_intersection(list1, list2)) #[5, 6, 7]
print(longest_sequence_intersection(list1, list3)) # None