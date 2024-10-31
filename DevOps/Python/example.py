from typing import List

class Solution:
    def maxDistToClosest(self, seats: List[int]) -> int:
        max_distance = 0
        last_person = -1
        n = len(seats)
        
        for i in range(n):
            if seats[i] == 1:
                if last_person == -1:
                    # Distance from the start to the first person
                    max_distance = i
                else:
                    # Distance between two people
                    max_distance = max(max_distance, (i - last_person) // 2)
                last_person = i
        
        # Distance from the last person to the end
        max_distance = max(max_distance, n - 1 - last_person)
        
        return max_distance

# Example usage:
sol = Solution()
seats1 = [1, 0, 0, 0, 1, 0, 1]
seats2 = [1, 0, 0, 0]
seats3 = [0, 1]

print(sol.maxDistToClosest(seats1))  # Output: 2
print(sol.maxDistToClosest(seats2))  # Output: 3
print(sol.maxDistToClosest(seats3))  # Output: 1