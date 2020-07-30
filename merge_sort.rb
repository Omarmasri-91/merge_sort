def merge_sort(arr)
    left=[]
    right=[]
    sorted=[]
    return arr if arr.length<2
    left = merge_sort(arr[0..arr.length/2-1])
    if arr.length>1
        right = merge_sort(arr[(arr.length/2)..arr.length])
    end
    left.each_with_index do |element, index|
        inserted="no"
        while inserted=="no"
            if right[0]==nil
                sorted.push(element)
                inserted="yes"
            elsif element<right[0]
                sorted.push(element)
                inserted="yes"
            else
                sorted.push(right[0])
                right.shift
            end
        end
    end
    if right.length>0
        sorted=sorted+right
    end
    return sorted
end
puts "Copy your unsorted array and paste it below:"
user_arr= gets.chop.delete("]").delete("[").delete(" ").split(",")
user_arr=user_arr.map do |element|
    element.to_i
end
puts "Here is your array sorted:"
merge_sort(user_arr)