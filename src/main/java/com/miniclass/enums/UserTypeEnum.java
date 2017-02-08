package com.miniclass.enums;

/**
 * Created by shuaizhiguo on 2016/12/13.
 */
public enum UserTypeEnum {

    USER_TYPE_a(0, "管理员"),
    USER_TYPE_1(1, "店员"),
    USER_TYPE_2(2, "店主"),
    USER_TYPE_3(3, "销售"),
    USER_TYPE_4(4, "经销商");

    private int value;

    private String name;

    private UserTypeEnum(int value, String name) {
        this.value = value;
        this.name = name;
    }

    public int getValue() {
        return value;
    }

    public String getName() {
        return name;
    }

    public static String getName(int value) {
        for (UserTypeEnum item : UserTypeEnum.values()) {
            if (item.value == value) {
                return item.name;
            }
        }
        return null;
    }

    public static UserTypeEnum getInstance(int value) {
        for (UserTypeEnum item : UserTypeEnum.values()) {
            if (item.value == value) {
                return item;
            }
        }
        return null;
    }


    
}
