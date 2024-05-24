Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3B884D03
	for <dtrace@lists.linux.dev>; Fri, 24 May 2024 23:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716595142; cv=fail; b=nd4Zj5b4K8CXtczlXGSyqFGuS6rVl7ZzlALAWWyBq3YApR/fJlu8w+0sf/F9dfWO/q8E5u8O/irmGipwZp4asYXpu2e0n03nW5a1hANBVIY9DG0rZ7lVldHYv+pzhVi7518IfmfWz/d+DlTEZwN38B4gAQ5HoqVi5h2a5F9PLmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716595142; c=relaxed/simple;
	bh=ASU9nWxLep30BsN0FMbdme+31TKOIzPek/9uYBelLZk=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=f0A97Bu2BcI2rXUPqS7ezAnHgupXKFs+hZHO9kUe1stbZkxUFJgNvhAcQPJdrgfdHDRQse9pWnbppMV9Cb+Iu+5++3NlBvI7YxF41Bzpw9hfZVqweRkJH3DGK92di23GHLsM0aJazf1vgFouwLgeFXoAPQrREkc0asEzejOG734=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SnRL/fRR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wiX/jY++; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SnRL/fRR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wiX/jY++"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44ONhLmZ004244
	for <dtrace@lists.linux.dev>; Fri, 24 May 2024 23:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : content-type : message-id : mime-version; s=corp-2023-11-20;
 bh=1cjkaUfaj120rhKTuhUnG3Urp7sHA5MuvGGfsaZMdGg=;
 b=SnRL/fRRa63jZ/i7yetxX2PCSRlDSnEadoHLBRlcYHzTeCHccYL112OnmifeAwmiWkmn
 SDDvEPUHvqeIIMi0dn8clTalyFCNU4xh7jtuB66/WRG7lFr7EY1Z8nG+sAbCCxZGKAWD
 xbkp7+O/REQqQNwUMmyAsKycN/yHozeR1MP6bM/YfdxJomuT9DSAQKYGfTKf8bZKxOis
 EEJA3n1xNMhIAcS6NxVdaYejm1jEnqqlcmhDmGmJag8SvkIXbHw8lCYwmCAVRsUp0Bcg
 qRjT2I1ZntdyeKyaKV4N9ICOYwjVlDmpF+IaF3A38qZCOxDJSrYT2jmOFprjIrob1nJd xw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y6k46djjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 May 2024 23:58:59 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44OM2L4o037830
	for <dtrace@lists.linux.dev>; Fri, 24 May 2024 23:58:58 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3y6jsjg4ch-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 May 2024 23:58:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vs2JSQn5vPoEog4GxcEEwwULEtJ+8v6h4uvup0GAUYINJzpaVUtat87noNxQqfbey57bxcLqBqq6SVssUkrCgUwaDmWggrCV8xEnWakQnA/xkIqQf6We4PNnC12q4lFKIqGTnXt66wKNSWCbIoPHCES1jMGkwnhXd76AFjQv2Q/OwyGQnWBw3oGoHSIAsPn0DsQmdwvdUmLvd8dj6SEyrzSWNjJdW8JDkj9jDHQmLiCwmOSfMD/UxiGrNDoddEnJB7+MgmFYy/oUpLv/UA92/knzBwKDQ+VmehegLH8UBd0giIfRG8+f4DfIFnovTkUVfc14FnHqH/SE5XtT/5SjsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cjkaUfaj120rhKTuhUnG3Urp7sHA5MuvGGfsaZMdGg=;
 b=cefcQCA17eIO60s3xVdTKmUU7K99bS4VdCx+3lp4hvQd4Kgtv+i7wOz0BB4/UsvOHZ6RmSncnsNbyO3bml7vw7AAzs3ZbEwY0knimYltasFagCg7mICDzaC3/Zxar6CbYmtgSizHFRNxJ1NmIfe/YMlH2XpNWkvCLIIy3TgDZLteJZNT1+IppzStN694v2kjnjwigZ7iY19/Ko/Q/KYtwsxy/JUaYGV8zOd0ss0ENQ5SypizqowrsjD0Nwnffq+e3pWHnoy2c2xbH7LqWMpqPfmce3MLjrJ6ZsbnOHT98iheYCJKdDwURmo6756T3Dgt+LlvNN+4L+Wwral9c846vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cjkaUfaj120rhKTuhUnG3Urp7sHA5MuvGGfsaZMdGg=;
 b=wiX/jY++OI/56Zy7Esy53f4NTdNzH05E2jZ4jOuslsrta6L9R3NhL7duMhMCFBPbpnKwu/541UPHtq7/emGpzVTibr1Z0VTS7xWPqHxdFD3vYekpb3yLpgi5KpQxV9GTicLh4yNwkhWrRJd+pdFKz67Epvv9AkXSBUlgJSYgRz8=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MW4PR10MB6324.namprd10.prod.outlook.com (2603:10b6:303:1ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Fri, 24 May
 2024 23:58:54 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%5]) with mapi id 15.20.7611.016; Fri, 24 May 2024
 23:58:54 +0000
Date: Fri, 24 May 2024 19:58:52 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 4/4] build: install sdt*.h in /usr/lib64/dtrace/include/sys
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0134.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::19) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID: 
 <SN7PR10MB6287D6325F0542771FD99313C2F52@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MW4PR10MB6324:EE_
X-MS-Office365-Filtering-Correlation-Id: 311fdf7f-b46f-4a16-1bed-08dc7c4d77c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+JDLx89Pap8KnRl5L0T4jUKQRXCdwGY328vBlDClkcSn9H2eiUMcmxtQm36s?=
 =?us-ascii?Q?3N7lFmflmwsKnYO5Tl01kZY3SblNKV7e651K4HJ5oGdCeXfTTBd1Xf6SfwJg?=
 =?us-ascii?Q?7dvbYTjVddqfRewILpEtWb5+j+faARWfGzOVOMq6KzldTjnFxnOOAambgZLv?=
 =?us-ascii?Q?q79gYVwzxC9QwHKPVGLNSAL/MKwxiZeGercyisD8RktsWuoFhskBcVN5hee5?=
 =?us-ascii?Q?qVS514JJ7OO9pGFH3x1N2HEV87gLVtpAzIwXI3wVXzNiEomBzhVbe/y0zfj0?=
 =?us-ascii?Q?N5Y4DpgKiFZcYWOyc9+77uXKvVk5WgKI/+n1/5lZA1ng+BPK1dymAj7mHtTv?=
 =?us-ascii?Q?Loi93RkcX7d9q5qKnD8xoiseyvoTW1/VIC1PwnOVtUciQ/7RQSL8r2jHvzvG?=
 =?us-ascii?Q?XDSxyciaPUPuiWzzuaXz0ZO/hT2w3XcF0qNahpnFJ4udWGvu/foPBKnmC+w8?=
 =?us-ascii?Q?ZF5PZbEIjMYCu1X/zdtR39p1b3ZwrYf/yKJinFMmYfFJW1FOIhDLDMBGd0ZL?=
 =?us-ascii?Q?PDhHRb/OHEoh0zhbv1kWwl4SD9wZVcB0Zdb0NLznmcdVRHfkalq9To47ARVe?=
 =?us-ascii?Q?NALdPr1TK1gdCEQluPXZFJIOptwZZJ8Nz/eLzvlwS+Njo2PwQTKoCbA7z/au?=
 =?us-ascii?Q?45Jo+dL+5dgKIlQYHUFNNrrOTtvJRh0dwH0zSLCRrNOzKmJPivjKt+y2Owt+?=
 =?us-ascii?Q?kNrdIFRKvfTJ0bOxzddmgbnS2hihePD8oLyA25BdJCyXOWyldJsKViylaM7O?=
 =?us-ascii?Q?CgZeU0wWMqeoDp4unbJcO/F4MNjhSbB567ELhpSj8fNudJ4xPKpisyT7uaus?=
 =?us-ascii?Q?fLo8ViGTTE2aYfWICrAhABqN5vsr/rw7RjfRx1eDX2OII6SvOSs71iFqwszq?=
 =?us-ascii?Q?sN7IYCdEAa4fIpGQRkIJY+NCt6M0eCEwt9xIu41ZFtsLnc3LLT7sU6wVpbtk?=
 =?us-ascii?Q?FvCV5KhKoiDYzMWRcSjn8GK1R9JH12SYBC0aNnHuGMUJ6QIu+pS1wETmAh5+?=
 =?us-ascii?Q?l4sp/IWwUV8UANvQOQer94U+VjSKvlXx99GDdJQdnb9jpapYLo648LaMv2Tq?=
 =?us-ascii?Q?2chZK4XBZe32Xh2EyEr2LtuCpTb5GwG5/g+gCoVLnY3REMwL+SBBJ/kjFtP6?=
 =?us-ascii?Q?oXJckvgAuuuUVZzZB132anLuL3jr3S4z6aShn9cXYqh68/EeiKGh+BGPKSrZ?=
 =?us-ascii?Q?RVRJJ+uunvhH2Z/8N3iNRGnPGvMyr3fXuJNdgges4ghFOqsm2dv8RD/znhs?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cAgpgw1OLZuU+I20mFoS0RnVM9B2EkHp71/+vyew+MwZuZd1snwbx41KQwpH?=
 =?us-ascii?Q?kAUMDR2JSQ8f/+F4delbWJXkSUsv86NymdApPp5b7/tMvP/+zcS0bv6IsGFU?=
 =?us-ascii?Q?w5kx1Flf2m33U4mUW90FOy15nWChdx8DT6a0iXrMetx5almSX60TgkayaQrv?=
 =?us-ascii?Q?fkVXtM8nLOKE7ROtlONV1HmMIAF+azonWKiDt/sNKYaCsGnwm0ddIpthU6np?=
 =?us-ascii?Q?iCXwUP5aCKtw2xiMVmvC7C7NAkFnEgyLQOWht6MFG92oz/3Izhq6FC6DmCHi?=
 =?us-ascii?Q?3XzXKMriydRWX672W5qetIp8jph37kjW5IH4gH0g82tWEv7XkRatHKkexLRX?=
 =?us-ascii?Q?PzrdDJSJnc4IDNgC7AzUUMZVgSqzwZBLReZPHYtrluqigQX80Sjrg9w4vPDY?=
 =?us-ascii?Q?DunnkgqTDY9OON5cnRHG9i4xbTHCuGPDvRzf5RzagaNDCHgmTQUlj1UfPBsb?=
 =?us-ascii?Q?W1Nz8ojrhqML1viP7iKCKNjtPv2XylhVflNWREozXQLzUXOr7mexKiuzw26N?=
 =?us-ascii?Q?by/Ot06+qAyfJDSoCr2O5XWKQ/IanL1x8csgTQe9HdZlxSp7hfBrVseI5zD2?=
 =?us-ascii?Q?sC/YnQnlBlWsz7rvmsUVYMyF6pSfB6L1I7DpP9GOFBO9EG4CaKqsDcE9rcUs?=
 =?us-ascii?Q?fvktpxtIvj5Opjpl5U2kzgmCQbqWozBDhmm6v6tgIygVOZkFVVuMFhE/tQ5c?=
 =?us-ascii?Q?hItMS58hQuNa1fhMUxYWz1qv4hG+eYJtzFQzX+4FTuPCINEzHEoA2YWWEVYd?=
 =?us-ascii?Q?94u3PY95ou3YaQHxyA6tmmxCH8eQnNph6IUvJzvWQkZFroQt+hzANOioO0Ce?=
 =?us-ascii?Q?A4koOc067nVVMQcwzWlxYOSpHLO4AcgRGmSZbLO5ieRdydJpmfuxLPG83sxi?=
 =?us-ascii?Q?QUOEJt9qPD1UFpPzcPGwXzH0P2OzvdgyvJdhfVfyOdwxjKZxBIlqedfEptpV?=
 =?us-ascii?Q?P80hWMxL6tzZ8Sy6veACdBCFHYSzqEflZtVxtS4hMddtZyGjFxd1geqx4CB8?=
 =?us-ascii?Q?RBcvGEvNhtq5HGNhXz7grL6CBJsXYVTczlBk3ihtXUz4nK4QriIrp1pTdPWH?=
 =?us-ascii?Q?BZKbLXf63LwHupH8/G565PSFkhoNvJHLKN0W4gzsBD5hVxMTq8mkVeOdSasK?=
 =?us-ascii?Q?HujEXtw9cdG8Kk+txq5xfux9nSozIEmveJVOOufsSTQrKyfduiMAqPVyhN50?=
 =?us-ascii?Q?GKENL7ttQJ6FsZ6XKbErwbLn8WEZSp5LEpLmwIUglSxfzaeWq2i9x9WFXdez?=
 =?us-ascii?Q?So/Fcvtd0nU0aynfHAtHq6Kur2WawxTHB0tqgvk9A3TJEQuDW9IrypnX5bzp?=
 =?us-ascii?Q?uVXl7FC+f7c9QMAjW0TYLGxEPx6OHROYQ6VWlg7pxXYfm7RWTdb3N7gRpLFN?=
 =?us-ascii?Q?sZ+AsfmyYYnTKqO0HkDuNkcwsmhceOKq8ZHby7RS51QzjU82aTRR6OSYyUD5?=
 =?us-ascii?Q?LULXvXEPRwKZjNNezPZTHYoeoyWjr4TsnV4vUSvuIDz4Q2EjrgJrbZeeHgFu?=
 =?us-ascii?Q?r8b/MjAj4uSd7mi57CBDq2Ln4uWFe/1ZRHxiv/TOp68C23uJXckBt+VwwpwJ?=
 =?us-ascii?Q?XdptFilyOvb/FUbUI4Nxqn/czglJTXTGWee0h/xigs6Gu9kawnDHDRLm3OkN?=
 =?us-ascii?Q?4h9XeVl9edOK+3DE1t8Yb6A=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	bw5L62BbU7J3KKcOwTITYqe755YF1B/5U2McYUE5aQ2D/1YSfSJ6Kz5tMjnXAqj+z2xC0oiKoMzIK5kLN9zuKFY0Cxs9rEW70/9tpVxXXa0a8Osdba9hOrCAwi8SNFLwLIoVSDGGTWmLfuUuN/LyzxxqaC4ZvWue7oV0/WQryYU6r1JUIIPZOdaDGPYoYIeaJx7HGR7HwRwsgms76rybr/9N8Gcv56BtevAn3Ibwyy9wk38atjLxf08kZkaw1q9xVtBcH6S5CuF3dmLmDNqCe19bRZxR4uBuTXFhnOWjdbiDalszfqtYydvdkaEA1Cdrt+1XhsRrImt8AuhdKizoomosMiDH9OK513+GBoCTZ6CSi3LIKc6UzZzNMNeHPVSVqkJ/1+SluAiLuj74drbd/ap9PrW0IJbgxjgC9BxVMhVkmL3pNGiB+HZho0TgAXz/M9zXNVn9XrL8Pac5x+XG+3G7T8Pn3AjzCwZ/4H1F2i204BDigUfV+Oz6x6pOGzb9cnKxfnRxGDJUMVb7RFsP1bhhxoMfoADP+2xL1Cy9rI5Bm0q0mGV68SZdgj04HwjYMsIW55L/6M8HjecFCmnaxKLRscNurKML3Q0HuHrt0ag=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 311fdf7f-b46f-4a16-1bed-08dc7c4d77c6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 23:58:54.4200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avhBWz1MJAgVIoyb55H2i6/ydzIuv+Smm24MmXnowSWjd8oe3196bRCIRlsFLWkgrcLzHGC8ev4arPwN5l/Gufg0nTGil8bZSKgj3mBHbS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6324
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_08,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405240174
X-Proofpoint-ORIG-GUID: RyevIceLyClqVwq6D8yv0NNm-zG7Mu0f
X-Proofpoint-GUID: RyevIceLyClqVwq6D8yv0NNm-zG7Mu0f

Author: Nick Alcock <nick.alcock@oracle.com>

With this change, we no longer confict with any systemtap packages!

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 GNUmakefile                           |  2 ++
 runtest.sh                            | 10 +++++-----
 test/unittest/pid/tst.provregex3.sh   |  6 +++---
 test/unittest/pid/tst.provregex4.sh   | 10 +++++-----
 test/unittest/usdt/tst.allargs.sh     |  4 ++--
 test/unittest/usdt/tst.entryreturn.sh |  4 ++--
 test/unittest/usdt/tst.linkpriv.sh    |  4 ++--
 test/unittest/usdt/tst.linkunpriv.sh  |  4 ++--
 test/unittest/usdt/tst.manyprobes.sh  |  4 ++--
 test/unittest/usdt/tst.reeval.sh      |  4 ++--
 test/unittest/usdt/tst.static.sh      |  4 ++--
 test/unittest/usdt/tst.static2.sh     |  4 ++--
 uts/Build                             | 16 ++++++++++++----
 13 files changed, 43 insertions(+), 33 deletions(-)

diff --git a/GNUmakefile b/GNUmakefile
index 360058c6..b1109727 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -86,6 +86,8 @@ BINDIR = $(prefix)/bin
 INSTBINDIR = $(DESTDIR)$(BINDIR)
 INCLUDEDIR = $(prefix)/include
 INSTINCLUDEDIR = $(DESTDIR)$(INCLUDEDIR)
+SDTINCLUDEDIR = $(LIBDIR)/dtrace/include
+INSTSDTINCLUDEDIR = $(DESTDIR)$(SDTINCLUDEDIR)
 SBINDIR = $(prefix)/sbin
 INSTSBINDIR = $(DESTDIR)$(SBINDIR)
 UDEVDIR = $(prefix)/lib/udev/rules.d
diff --git a/runtest.sh b/runtest.sh
index 35d50069..3bcd676e 100755
--- a/runtest.sh
+++ b/runtest.sh
@@ -559,7 +559,7 @@ if [[ -z $USE_INSTALLED ]]; then
     dtrace="$(pwd)/build*/dtrace"
     test_libdir="$(pwd)/build/dlibs"
     test_ldflags="-L$(pwd)/build"
-    test_incflags="-Iinclude -Iuts/common -Ibuild -Ilibdtrace -DARCH_$arch"
+    test_cppflags="-Iinclude -Iuts/common -Ibuild -Ilibdtrace -DARCH_$arch"
     helper_device="dtrace/test-$$"
     # Pre-existing directories from earlier tests are just fine!
     # dtprobed will clean things up.
@@ -579,7 +579,7 @@ else
     dtrace="/usr/sbin/dtrace"
     test_libdir="installed"
     test_ldflags=""
-    test_incflags="-DARCH_$arch"
+    test_cppflags="-DARCH_$arch -I/usr/lib64/dtrace/include"
 
     if [[ ! -x $dtrace ]]; then
         echo "$dtrace not available." >&2
@@ -587,6 +587,7 @@ else
     fi
 fi
 export dtrace
+export test_cppflags
 
 # Figure out if the preprocessor supports -fno-diagnostics-show-option: if it
 # does, add a bunch of options designed to make GCC output look like it used
@@ -594,7 +595,6 @@ export dtrace
 # Regardless, turn off display of column numbers, if possible: they vary
 # between GCC releases.
 
-test_cppflags=
 if ! /usr/bin/cpp -x c -fno-diagnostics-show-caret - /dev/null < /dev/null 2>&1 | \
 	grep -q 'unrecognized command line option'; then
     export DTRACE_OPT_CPPARGS="-fno-diagnostics-show-caret -fdiagnostics-color=never -fno-diagnostics-show-option -fno-show-column"
@@ -1129,7 +1129,7 @@ for dt in $dtrace; do
         # Default and substitute in flags.  The raw_dt_flags apply even to a
         # sh invocation.
 
-        raw_dt_flags="$test_incflags"
+        raw_dt_flags="$test_cppflags"
 
         expected_tag=
         if [[ $testonly =~ ^err\.D_ ]]; then
@@ -1204,7 +1204,7 @@ for dt in $dtrace; do
 
             CC="${CC:-gcc}"
             CCline="$CC -std=gnu99 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64"
-            CCline="$CCline $test_incflags $CFLAGS $test_ldflags $LDFLAGS"
+            CCline="$CCline $test_cppflags $CFLAGS $test_ldflags $LDFLAGS"
             CCline="$CCline -o $tmpdir/$(basename $base) $_test $link"
             log "Compiling $CCline\n"
             if ! $CCline >/dev/null 2>$tmpdir/cc.err; then
diff --git a/test/unittest/pid/tst.provregex3.sh b/test/unittest/pid/tst.provregex3.sh
index 6e1afd3e..7ebfb28e 100755
--- a/test/unittest/pid/tst.provregex3.sh
+++ b/test/unittest/pid/tst.provregex3.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2008, 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2008, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -23,10 +23,10 @@ cat > $DIR/Makefile <<EOF
 all: main
 
 main: main.o prov.o
-	cc -o main main.o prov.o
+	cc $test_cppflags -o main main.o prov.o
 
 main.o: main.c prov.h
-	cc -c main.c
+	cc $test_cppflags -c main.c
 
 prov.h: prov.d
 	$dtrace -h -s prov.d
diff --git a/test/unittest/pid/tst.provregex4.sh b/test/unittest/pid/tst.provregex4.sh
index a9ff3238..e4248e15 100755
--- a/test/unittest/pid/tst.provregex4.sh
+++ b/test/unittest/pid/tst.provregex4.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2008, 2020, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2008, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -25,10 +25,10 @@ cat > $DIR/Makefile <<EOF
 all: main altlib.so
 
 main: main.o provmain.o
-	cc -o main main.o provmain.o -ldl
+	cc $test_cppflags -o main main.o provmain.o -ldl
 
 main.o: main.c prov.h
-	cc -c main.c
+	cc $test_cppflags -c main.c
 
 prov.h: prov.d
 	$dtrace -h -s prov.d
@@ -37,10 +37,10 @@ provmain.o: prov.d main.o
 	$dtrace -G -o provmain.o -s prov.d main.o
 
 altlib.so: altlib.o provalt.o
-	cc -z defs --shared -o altlib.so altlib.o provalt.o
+	cc $test_cppflags -z defs --shared -o altlib.so altlib.o provalt.o
 
 altlib.o: altlib.c prov.h
-	cc -c altlib.c
+	cc $test_cppflags -c altlib.c
 
 provalt.o: prov.d altlib.o
 	$dtrace -G -o provalt.o -s prov.d altlib.o
diff --git a/test/unittest/usdt/tst.allargs.sh b/test/unittest/usdt/tst.allargs.sh
index 20f9de90..d233615f 100755
--- a/test/unittest/usdt/tst.allargs.sh
+++ b/test/unittest/usdt/tst.allargs.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2018, 2020, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2018, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -16,7 +16,7 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS="-std=gnu89 -I${PWD}/uts/common"
+CFLAGS="-std=gnu89 $test_cppflags"
 
 DIRNAME="$tmpdir/usdt-allargs.$$.$RANDOM"
 mkdir -p $DIRNAME
diff --git a/test/unittest/usdt/tst.entryreturn.sh b/test/unittest/usdt/tst.entryreturn.sh
index 6c14ece2..d777c1ac 100755
--- a/test/unittest/usdt/tst.entryreturn.sh
+++ b/test/unittest/usdt/tst.entryreturn.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2007, 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -14,7 +14,7 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS="-I${PWD}/uts/common"
+CFLAGS="$test_cppflags"
 
 DIRNAME="$tmpdir/usdt-entryreturn.$$.$RANDOM"
 mkdir -p $DIRNAME
diff --git a/test/unittest/usdt/tst.linkpriv.sh b/test/unittest/usdt/tst.linkpriv.sh
index 1a088f82..c008e66d 100755
--- a/test/unittest/usdt/tst.linkpriv.sh
+++ b/test/unittest/usdt/tst.linkpriv.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2016, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -12,7 +12,7 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS="-std=gnu99 -I${PWD}/uts/common"
+CFLAGS="-std=gnu99 $test_cppflags"
 
 DIRNAME="$tmpdir/usdt-linkpriv.$$.$RANDOM"
 mkdir -p $DIRNAME
diff --git a/test/unittest/usdt/tst.linkunpriv.sh b/test/unittest/usdt/tst.linkunpriv.sh
index 71d42ae4..bf52bc6a 100755
--- a/test/unittest/usdt/tst.linkunpriv.sh
+++ b/test/unittest/usdt/tst.linkunpriv.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -14,7 +14,7 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS="-I${PWD}/uts/common"
+CFLAGS="$test_cppflags"
 
 DIRNAME="$tmpdir/usdt-linkunpriv.$$.$RANDOM"
 mkdir -p $DIRNAME
diff --git a/test/unittest/usdt/tst.manyprobes.sh b/test/unittest/usdt/tst.manyprobes.sh
index dd97250e..a3b23874 100755
--- a/test/unittest/usdt/tst.manyprobes.sh
+++ b/test/unittest/usdt/tst.manyprobes.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -12,7 +12,7 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS="-I${PWD}/uts/common"
+CFLAGS="$test_cppflags"
 DIRNAME="$tmpdir/usdt-manyprobes.$$.$RANDOM"
 mkdir -p $DIRNAME
 cd $DIRNAME
diff --git a/test/unittest/usdt/tst.reeval.sh b/test/unittest/usdt/tst.reeval.sh
index 3b32a280..56011a4f 100755
--- a/test/unittest/usdt/tst.reeval.sh
+++ b/test/unittest/usdt/tst.reeval.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2007, 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -13,7 +13,7 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS="-I${PWD}/uts/common"
+CFLAGS="$test_cppflags"
 
 DIRNAME="$tmpdir/usdt-reeval.$$.$RANDOM"
 mkdir -p $DIRNAME
diff --git a/test/unittest/usdt/tst.static.sh b/test/unittest/usdt/tst.static.sh
index a016f1c6..bd71c2e4 100755
--- a/test/unittest/usdt/tst.static.sh
+++ b/test/unittest/usdt/tst.static.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -12,7 +12,7 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS="-I${PWD}/uts/common"
+CFLAGS="$test_cppflags"
 
 DIRNAME="$tmpdir/usdt-static.$$.$RANDOM"
 mkdir -p $DIRNAME
diff --git a/test/unittest/usdt/tst.static2.sh b/test/unittest/usdt/tst.static2.sh
index ec611873..29fd3597 100755
--- a/test/unittest/usdt/tst.static2.sh
+++ b/test/unittest/usdt/tst.static2.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -16,7 +16,7 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS="-I${PWD}/uts/common"
+CFLAGS="$test_cppflags"
 
 DIRNAME="$tmpdir/usdt-static2.$$.$RANDOM"
 mkdir -p $DIRNAME
diff --git a/uts/Build b/uts/Build
index f445115d..864b2dfd 100644
--- a/uts/Build
+++ b/uts/Build
@@ -1,6 +1,6 @@
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2011, 2017, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2011, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -10,11 +10,19 @@ uts_DIR := $(current-dir)
 # provide the userspace versions of types defined distincty by the kernel.
 
 SYS_HEADERS_INSTALL := common/sys/dtrace.h \
-                       common/sys/dtrace_types.h \
-                       common/sys/sdt.h \
-                       common/sys/sdt_internal.h
+                       common/sys/dtrace_types.h
+
+# sdt*.h are used by programs that contain USDT probes that want to define
+# probes by hand rather than using dtrace -h.  SystemTap has another header
+# with the same name, so we install these out of the way.
+
+PROBE_HEADERS_INSTALL := common/sys/sdt.h \
+                         common/sys/sdt_internal.h
 
 install::
 	mkdir -p $(INSTINCLUDEDIR)/sys
 	$(call describe-install-target,$(INSTINCLUDEDIR)/sys,$(notdir $(SYS_HEADERS_INSTALL)))
 	cd $(uts_DIR) && install -m 644 $(SYS_HEADERS_INSTALL) $(INSTINCLUDEDIR)/sys
+	mkdir -p $(INSTSDTINCLUDEDIR)/sys
+	$(call describe-install-target,$(INSTSDTINCLUDEDIR)/sys,$(notdir $(PROBE_HEADERS_INSTALL)))
+	cd $(uts_DIR) && install -m 644 $(PROBE_HEADERS_INSTALL) $(INSTSDTINCLUDEDIR)/sys
-- 
2.42.0

