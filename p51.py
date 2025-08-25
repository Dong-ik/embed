'''
Created on 2025. 6. 16.

@author: user
'''


def testFuntion():
    global globalVar #global 속성으로 전역변수를 사용할때 처음라인은 선언만 할 수 있다.
    globalVar=100
    localVar=200
    print("localVar=", localVar)
    return globalVar

#print("globalVar=", globalVar)

def testFuntion1():
    globalVar=1000
    return globalVar

testFuntion()
testFuntion1()

print(testFuntion())
print(testFuntion1())



