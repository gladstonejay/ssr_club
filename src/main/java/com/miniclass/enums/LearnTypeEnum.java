package com.miniclass.enums;

/**
 * Created by shuaizhiguo on 2017/2/7.
 */
public enum LearnTypeEnum {

    LEARN_TYPE_ENUM_0(0, "video"),
    LEARN_TYPE_ENUM_1(1, "weixin"),
    LEARN_TYPE_ENUM_2(2, "exam");


    private int value;

    private String name;

    private LearnTypeEnum(int value, String name) {
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
        for (LearnTypeEnum item : LearnTypeEnum.values()) {
            if (item.value == value) {
                return item.name;
            }
        }
        return null;
    }

    public static LearnTypeEnum getInstance(int value) {
        for (LearnTypeEnum item : LearnTypeEnum.values()) {
            if (item.value == value) {
                return item;
            }
        }
        return null;
    }
}
