CXX = g++
CXXFLAGS = -Wall -Wextra -pedantic -std=c++11

TARGET = factorial

.PHONY: all clean

all: $(TARGET)

$(TARGET): factorial.o
	$(CXX) $(CXXFLAGS) $^ -o $@

factorial.o: factorial.cpp
	$(CXX) $(CXXFLAGS) -c $<

clean:
	rm -f $(TARGET) *.o