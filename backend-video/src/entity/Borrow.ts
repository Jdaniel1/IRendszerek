import { Entity, PrimaryGeneratedColumn, Column, ManyToOne } from 'typeorm';
import { Cassette } from './Cassette';
import { DVD } from './DVD';
import { Member } from './Member';

@Entity()
export class Borrow {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  borrowDate: Date;

  @Column()
  returnDate: Date;

  @ManyToOne(() => Member, member => member.borrows, {eager: true})
  member: Member;

  @ManyToOne(() => Cassette, cassette => cassette.borrows, {eager: true})
  cassette: Cassette;

  @ManyToOne(() => DVD, dvd => dvd.borrows, {eager: true})
  dvd: DVD;

  @Column() 
  maxBorrowsCount: number;

  @Column()
  delay: number;
}