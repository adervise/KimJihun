// ORM class for table 'null'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Tue Aug 25 16:39:10 KST 2015
// For connector: org.apache.sqoop.manager.GenericJdbcManager
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.mapred.lib.db.DBWritable;
import com.cloudera.sqoop.lib.JdbcWritableBridge;
import com.cloudera.sqoop.lib.DelimiterSet;
import com.cloudera.sqoop.lib.FieldFormatter;
import com.cloudera.sqoop.lib.RecordParser;
import com.cloudera.sqoop.lib.BooleanParser;
import com.cloudera.sqoop.lib.BlobRef;
import com.cloudera.sqoop.lib.ClobRef;
import com.cloudera.sqoop.lib.LargeObjectLoader;
import com.cloudera.sqoop.lib.SqoopRecord;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class QueryResult extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  protected ResultSet __cur_result_set;
  private String CATEGORYID;
  public String get_CATEGORYID() {
    return CATEGORYID;
  }
  public void set_CATEGORYID(String CATEGORYID) {
    this.CATEGORYID = CATEGORYID;
  }
  public QueryResult with_CATEGORYID(String CATEGORYID) {
    this.CATEGORYID = CATEGORYID;
    return this;
  }
  private String BIZ_SQL;
  public String get_BIZ_SQL() {
    return BIZ_SQL;
  }
  public void set_BIZ_SQL(String BIZ_SQL) {
    this.BIZ_SQL = BIZ_SQL;
  }
  public QueryResult with_BIZ_SQL(String BIZ_SQL) {
    this.BIZ_SQL = BIZ_SQL;
    return this;
  }
  private String LOG_INFO;
  public String get_LOG_INFO() {
    return LOG_INFO;
  }
  public void set_LOG_INFO(String LOG_INFO) {
    this.LOG_INFO = LOG_INFO;
  }
  public QueryResult with_LOG_INFO(String LOG_INFO) {
    this.LOG_INFO = LOG_INFO;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof QueryResult)) {
      return false;
    }
    QueryResult that = (QueryResult) o;
    boolean equal = true;
    equal = equal && (this.CATEGORYID == null ? that.CATEGORYID == null : this.CATEGORYID.equals(that.CATEGORYID));
    equal = equal && (this.BIZ_SQL == null ? that.BIZ_SQL == null : this.BIZ_SQL.equals(that.BIZ_SQL));
    equal = equal && (this.LOG_INFO == null ? that.LOG_INFO == null : this.LOG_INFO.equals(that.LOG_INFO));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.CATEGORYID = JdbcWritableBridge.readString(1, __dbResults);
    this.BIZ_SQL = JdbcWritableBridge.readString(2, __dbResults);
    this.LOG_INFO = JdbcWritableBridge.readString(3, __dbResults);
  }
  public void loadLargeObjects(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void write(PreparedStatement __dbStmt) throws SQLException {
    write(__dbStmt, 0);
  }

  public int write(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(CATEGORYID, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BIZ_SQL, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(LOG_INFO, 3 + __off, 12, __dbStmt);
    return 3;
  }
  public void readFields(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.CATEGORYID = null;
    } else {
    this.CATEGORYID = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BIZ_SQL = null;
    } else {
    this.BIZ_SQL = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.LOG_INFO = null;
    } else {
    this.LOG_INFO = Text.readString(__dataIn);
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.CATEGORYID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, CATEGORYID);
    }
    if (null == this.BIZ_SQL) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BIZ_SQL);
    }
    if (null == this.LOG_INFO) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, LOG_INFO);
    }
  }
  private final DelimiterSet __outputDelimiters = new DelimiterSet((char) 1, (char) 10, (char) 0, (char) 0, false);
  public String toString() {
    return toString(__outputDelimiters, true);
  }
  public String toString(DelimiterSet delimiters) {
    return toString(delimiters, true);
  }
  public String toString(boolean useRecordDelim) {
    return toString(__outputDelimiters, useRecordDelim);
  }
  public String toString(DelimiterSet delimiters, boolean useRecordDelim) {
    StringBuilder __sb = new StringBuilder();
    char fieldDelim = delimiters.getFieldsTerminatedBy();
    __sb.append(FieldFormatter.escapeAndEnclose(CATEGORYID==null?"null":CATEGORYID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BIZ_SQL==null?"null":BIZ_SQL, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(LOG_INFO==null?"null":LOG_INFO, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  private final DelimiterSet __inputDelimiters = new DelimiterSet((char) 1, (char) 10, (char) 0, (char) 0, false);
  private RecordParser __parser;
  public void parse(Text __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharSequence __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(byte [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(char [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(ByteBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  private void __loadFromFields(List<String> fields) {
    Iterator<String> __it = fields.listIterator();
    String __cur_str;
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.CATEGORYID = null; } else {
      this.CATEGORYID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BIZ_SQL = null; } else {
      this.BIZ_SQL = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.LOG_INFO = null; } else {
      this.LOG_INFO = __cur_str;
    }

  }

  public Object clone() throws CloneNotSupportedException {
    QueryResult o = (QueryResult) super.clone();
    return o;
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new TreeMap<String, Object>();
    __sqoop$field_map.put("CATEGORYID", this.CATEGORYID);
    __sqoop$field_map.put("BIZ_SQL", this.BIZ_SQL);
    __sqoop$field_map.put("LOG_INFO", this.LOG_INFO);
    return __sqoop$field_map;
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if ("CATEGORYID".equals(__fieldName)) {
      this.CATEGORYID = (String) __fieldVal;
    }
    else    if ("BIZ_SQL".equals(__fieldName)) {
      this.BIZ_SQL = (String) __fieldVal;
    }
    else    if ("LOG_INFO".equals(__fieldName)) {
      this.LOG_INFO = (String) __fieldVal;
    }
    else {
      throw new RuntimeException("No such field: " + __fieldName);
    }
  }
}
