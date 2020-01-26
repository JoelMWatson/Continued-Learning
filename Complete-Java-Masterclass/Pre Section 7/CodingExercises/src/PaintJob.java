public class PaintJob {
    public static void main(String[] args) {
        System.out.println(getBucketCount(-3.4, 2.1, 1.5, 2));
        System.out.println(getBucketCount(3.4, 2.1, 1.5, 2));
        System.out.println(getBucketCount(2.75, 3.25, 2.5, 1));
    }

    public static int getBucketCount(double width, double height, double areaPerBucket, int extraBuckets) {
        int count = 0;
        if (width <= 0 || height <= 0 || areaPerBucket <= 0 || extraBuckets < 0) {
            count = -1;
        } else {
            double area = height * width;
            area -= extraBuckets * areaPerBucket;
            count = (int) Math.ceil(area / areaPerBucket);
        }
        return count;
    }

    public static int getBucketCount(double width, double height, double areaPerBucket) {
        int count = 0;
        if (width <= 0 || height <= 0 || areaPerBucket <= 0) {
            count = -1;
        } else {
            double area = height * width;
            count = (int) Math.ceil(area / areaPerBucket);
        }
        return count;
    }

    public static int getBucketCount(double area, double areaPerBucket) {
        int count = 0;
        if (area <= 0 || areaPerBucket <= 0) {
            count = -1;
        } else {
            count = (int) Math.ceil(area / areaPerBucket);
        }
        return count;
    }
}