def flatten(lst):
    result = []
    for item in lst:
        if isinstance(item, list):
            result.extend(flatten(item))
        else:
            result.append(item)
    return result

listA = [3,[7,3],[3,7,3,[5,1,[1,4],3]],[5]]
print(flatten(listA))  # [3, 7, 3, 3, 7, 3, 5, 1, 1, 4, 3, 5]