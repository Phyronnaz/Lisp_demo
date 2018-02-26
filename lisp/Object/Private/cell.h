#pragma once

#include <string>
#include <vector>

/*****************************/

class Cell
{
public:
    Cell() : GC_id(0xDEADBEEF), no_GC(0) {}
    virtual ~Cell() = default;

    enum class sort
    {
        NUMBER, STRING, SYMBOL, PAIR
    };

    virtual sort get_sort() const = 0;

    // Id for the GC
    unsigned GC_id;
    // If the object should be GC or not
    unsigned no_GC:1;
};

/*****************************/
class Cell_Number : public Cell
{
private:
    int contents;
public:
    sort get_sort() const override;

    explicit Cell_Number(int _contents);

    int get_contents() const;
};

/*****************************/

class Cell_String : public Cell
{
private:
    std::string contents;
public:
    sort get_sort() const override;

    explicit Cell_String(const std::string& s);

    std::string get_contents() const;
};

/*****************************/

class Cell_Symbol : public Cell
{
private:
    std::string contents;
public:
    sort get_sort() const override;

    explicit Cell_Symbol(const std::string& s);

    std::string get_contents() const;
};

/*****************************/

class Cell_Pair : public Cell
{
private:
    Cell* car;
    Cell* cdr;
public:
    sort get_sort() const override;

    explicit Cell_Pair(Cell* _car, Cell* _cdr);

    Cell* get_car() const;

    Cell* get_cdr() const;
};