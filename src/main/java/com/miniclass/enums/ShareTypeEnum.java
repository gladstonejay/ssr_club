package com.miniclass.enums;

/**
 * Created by shuaizhiguo on 2016/12/13.
 */
public enum ShareTypeEnum {

    USER_TYPE_1(1, "行业动态"),
    USER_TYPE_2(2, "品牌中心"),
    USER_TYPE_4(3, "完美门店"),
    USER_TYPE_5(4, "精英战报"),
    USER_TYPE_6(5, "区域销售排行榜"),
    USER_TYPE_8(6, "门店销售排行榜"),
    USER_TYPE_9(7, "经销商销售排行榜");

    private int value;

    private String name;

    private ShareTypeEnum(int value, String name) {
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
        for (ShareTypeEnum item : ShareTypeEnum.values()) {
            if (item.value == value) {
                return item.name;
            }
        }
        return null;
    }

    public static ShareTypeEnum getInstance(int value) {
        for (ShareTypeEnum item : ShareTypeEnum.values()) {
            if (item.value == value) {
                return item;
            }
        }
        return null;
    }


    
}
