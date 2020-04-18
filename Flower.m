classdef Flower
    properties
        petalWidth
        petalLength
        sepalWidth
        sepalLength
        species
    end
    
    methods
        function obj = Flower(input1,input2,input3,input4,input5)
            obj.petalWidth = input1;
            obj.petalLength = input2;
            obj.sepalWidth = input3;
            obj.sepalLength = input4;
            obj.species = input5;
        end
        
        function SWidth = getSWidth(obj)
            SWidth = obj.sepalWidth;
        end
        
        function report(obj)
            disp("The length and width of its sepal are "+ obj.sepalLength+" cm and "+obj.sepalWidth+" cm respectively, while the length and width of its petal are "+ obj.petalLength+ "cm and "+ obj.petalWidth+"cm respectively. It belongs to the "+obj.species+" species.");
        end
    end
end

