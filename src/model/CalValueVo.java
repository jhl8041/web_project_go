package model;

public class CalValueVo {
int month;
int year;
int lastDay;
int dayofWeek;

public CalValueVo() {
	
}

public CalValueVo(int month, int year, int lastDay, int dayofWeek) {
	super();
	this.month = month;
	this.year = year;
	this.lastDay = lastDay;
	this.dayofWeek = dayofWeek;
}

public int getMonth() {
	return month;
}

public void setMonth(int month) {
	this.month = month;
}

public int getYear() {
	return year;
}

public void setYear(int year) {
	this.year = year;
}

public int getLastDay() {
	return lastDay;
}

public void setLastDay(int lastDay) {
	this.lastDay = lastDay;
}

public int getDayofWeek() {
	return dayofWeek;
}

public void setDayofWeek(int dayofWeek) {
	this.dayofWeek = dayofWeek;
}

@Override
public String toString() {
	return "CalValueVo [month=" + month + ", year=" + year + ", lastDay=" + lastDay + ", dayofWeek=" + dayofWeek + "]";
}



}
