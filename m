Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2940B2BAF9
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 15:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730216256; cv=fail; b=jYO9G0n8vybQpuBAuVQOSmrE70kMiS9YNEjqR+XV9U4iDKwCyhfYuLCSRLfOiklOaS9h6tnkfRJLKKLL7PlCSMonbpbmsocTihcNdgsNdVDa/gsGKHmf/sAewxFbt/ARIqf4uZemjvkp/9JLW2rxWzNBIhKa65egQ2jk1iOzNAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730216256; c=relaxed/simple;
	bh=ge0Y1tsxYR9okOjwv3CZx17ACnakhsHsVg1LFnRRilk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S6+C+NF1uYuknespwA6bgZA+z/AsbVTVsXZXqn5GMs6jKm5nIE4LKyxC0GtqKI6Ui0iH7Jkf+EejQWEa7V5xcfIfX1Q5G9W4DcWbz5MFGyEHlKv3f/HqNpBmHY3L4n5CfOAiuB70eS5w4mA3R8NtbksbfuzptK2DhEkOi6UUM/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=W4UwOzKg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JAhSYpUh; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="W4UwOzKg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JAhSYpUh"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TEtbE6014306
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 15:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=3aY0D9g9tKHuq86EbR
	ut2ImFfSoR/ckaLiObE3+zURA=; b=W4UwOzKgr+qr1RI7ikvCJzGYlZeeAAtn6L
	r2g17MuCc+lZvn730SorrnLao4gzgvDkSYKSnlLvzFCHDjzTgw2R8RggQ/BL7TuI
	zsSV2XmVHYB20Gx8UUtlOGbvpA9l8vZp48F4uMz59hynRr5ZsTiC+mypsnIYAxwN
	9KcNyH2tsoWvoytjkL9hcTZZk1r+rvDgqcomivKtK9IeyswojuKWrbHmtIlb4rf8
	NZeaBaIpxh3MQB22xl+OO+WV7aexHHPKpJPHmeiILssex0jQqsdAsAL7W58of4bV
	DLSxFRQolRucDrZ+uA9TBT3p6gDRXOnD5DDnjdttzYK/NCPxoKNQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdp5ujt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 15:37:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49TEUBbw008492
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 15:37:32 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hne9tna0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 15:37:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AoMV5FnCsIArBnLbYMtUxaPFOPIG8ZXa2MTw5/MT9jvlFqel9AB/rcSuSS2jcS3KHJxw7IU8Z3CnrtsP4l5TDRHewzt7G116Fl38iIsJywzf3WxRtX9tVNKPtYECiJo61YsR0ut89WDvTSEDarcSSMRCLgaH/jR3QFniLauMmKQxAO1amP76T1Tohi1NUaZQmqQ7h91T3mXNvPpeWj5+L72zDAxvlSORwlP2FajT6nPRaq1Y6OHbLizwtBHl0fE0naWS3Ija0g4urRqfc8vWNhDNUZmyyVYMvsP67O/0EGQAMReUZlG1p/5onSAYmPynf+c/WhXI448LHTw4oG4xtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3aY0D9g9tKHuq86EbRut2ImFfSoR/ckaLiObE3+zURA=;
 b=o27Knfb5I1xuiGwJQgcfwl1e514zYvGDTcSWPCuIQy78c84SO0arsV9rsSKyu4zLztF6lo4CixNwvtaf+swOQm4DhZyrJfArOCIzyOzx9J0balTi2RXG+5F+9ivIuQVKV5w1YcD8eusvKLqXuJVe7TUARLrVZQ2RysPKe5kvejt5ysX2VqrXo84VwzGUo+02dDHeH2jtodSbYhI7346YPXdXfRrcVCuT1JK5yI0PiKqskqhmCaY2osMh5pNcRivDdxdvv0tE2Cxxjn1u9VXAqmh8TUBEHK2OoycGXIHiGR+8QCxJTsEv1AX5I5+fBmAut7oADhgZQD7E8YNRArTuHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3aY0D9g9tKHuq86EbRut2ImFfSoR/ckaLiObE3+zURA=;
 b=JAhSYpUhGo93SJ5zorTCX5ZV582Kr8Yrc2jG7tzDnrcem5vagnNw7nidmA6OLDfi6Iq794E8TnI8dWqoH8sCt03TZRdA/OljcxBR7lJ8398LB2dnOfKJzNCITsUPi4h8Kr0K/Ow3z7WKeGLsAUIvvtD1aZfCzLttBSmxKLXYP28=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SA1PR10MB6319.namprd10.prod.outlook.com (2603:10b6:806:252::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Tue, 29 Oct
 2024 15:37:29 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8114.015; Tue, 29 Oct 2024
 15:37:29 +0000
Date: Tue, 29 Oct 2024 11:37:24 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/2] USDT probes need provider spec ending with 0-9 or *
Message-ID: <ZyEBNIaFgwdsZwp9@kvh-deb-bpf.us.oracle.com>
References: <20241009223035.5659-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009223035.5659-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BN9PR03CA0274.namprd03.prod.outlook.com
 (2603:10b6:408:f5::9) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SA1PR10MB6319:EE_
X-MS-Office365-Filtering-Correlation-Id: 030ba431-610b-4789-846d-08dcf82f98b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gYmBCuKS4iXLA2u7DhM33dlvJXyj6ukybuMe01DpDr+W0adNJkRYDqf54U0e?=
 =?us-ascii?Q?YqDA4zUo2xe7numTI+VoTCJQtXpInpSNY/tAaFJsW4TGQ84oV1g9zOHl5nSJ?=
 =?us-ascii?Q?mterKA9TEdeCJe6MnSaaQvzAymLGNQeE5z1DqKsVAPJ2nuncCURiWfS6qnA2?=
 =?us-ascii?Q?dqlkorvFJJolPeX7iYfepE7Yq2UwogGxoSS3PYMmsO0KxRumw2L2ol77EdlE?=
 =?us-ascii?Q?R4Ms21pZdcaDipZOSCk3NFUclY9Tc3fnD+IUKiEaWgWiX6CJavMEHE91dSjK?=
 =?us-ascii?Q?7JtPWL+gtVZzEgpoTagBWEadZD+4ssEROgzm2uDKG+w/BzQn5MAy9A7YO2jc?=
 =?us-ascii?Q?NWnmC8pv501Cxk4hYMpX45Kd5qx61ryt/kUOKHcJ4zvB+wTw2RPYSUSCAW0+?=
 =?us-ascii?Q?QTw15EARxu42Dye0JhAmkQmq8bAlwvcf/swdmcIWM8GUCtZxTFDIwO+o72ug?=
 =?us-ascii?Q?SuSPt3uj0nTEE0oSAREgPrym0TzZEkibpVUyKG5KID+bxwf9ZImhk65cWq52?=
 =?us-ascii?Q?sXne9o8WFZgHANeIARHEtp5A7oUGZ5HFIINSIEmdStvhF6oax734iXMCwnD3?=
 =?us-ascii?Q?N8Jknlp6Q1jV+318UFWv7+2CA8U1NYrTm2gz+eC/RJZ+rSS/d2TxLn9YKc1P?=
 =?us-ascii?Q?b+3X+28brg23e1TLahfsBN5SHic5iUlRZ++tSzpUam+UVjrSB1dVnuyg2uTk?=
 =?us-ascii?Q?Fg3icyjk4qEv6ZCncnqpgSjVB8S9BP7SV0OOTLNt4ocKlfCfM5tuNUmBmY9K?=
 =?us-ascii?Q?RjMZeHSRiXzVrq1uulpfGw8CcHchh/eBdBCl1x8cObthwNyYACMUCnHIrRGD?=
 =?us-ascii?Q?pFLfc+8yIm75XpuPA5WGl3ymlLIpcayhYtTWNlK7yn9jswoW/GAhlP8G2Iom?=
 =?us-ascii?Q?FlsBLI/mUv6zL7/zocx3ynLevkPYNR5JvHOYQeVPB8ziWZcsISpie4J4uqbV?=
 =?us-ascii?Q?aEPTdr6IpOm5KqMaPtPJGcWqkGbX/ZNHIsFZaDINLggjbnBlEzqXnpck29OS?=
 =?us-ascii?Q?NDs8C+WevHosUqPSMfBDcTMeueDsOQfNjKCyiRfDnjWOA0evqgwludF8A/vu?=
 =?us-ascii?Q?XLxhBGsXHB9Tr3aKFFkINDvpCXnK035DTIUfuVlo01TBdjjH7FgT1MQ3aSzq?=
 =?us-ascii?Q?LFIs4VXjjPwFFy9hgLbPHIATMFD+TBC7ccpJNm93Js1ztMEcYLOk5yssC9NA?=
 =?us-ascii?Q?DpiSucCe8NYju2qZQOyIcscHivlC4QJO3+mkl5vSsq6f0JKX0HTSarilveGB?=
 =?us-ascii?Q?4MqT99eD4OyaApRMO2AWXVPuijnXjJwXHxyYXwDAj4zbqTH23S8ubsqBhNjr?=
 =?us-ascii?Q?ukIInMI6RA/QUkwi1ntgf885?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZPY8P8lcpErBoCEa5j8rDQGeV1BgaI8TiGLbVhBNNKkKdgwVhTykgwgl22Ck?=
 =?us-ascii?Q?65l7Ndpf/wfl3VB5qnteJC0jjpg8/EEnY+pShjTY0UN0OvKWQt6To8tuI9zU?=
 =?us-ascii?Q?HAIDtc0sPeqseSyXODLDomS0cluX+0DzWF37rVEIA6QdvrSDM7oQeujLPk9D?=
 =?us-ascii?Q?FGu22sH8ryCI/RAkr8OX21isTcVCX5pTyNfe8j4eAGED0v6RB968aZHovVVw?=
 =?us-ascii?Q?75LBXw2AgeT79raJbbi6AZav2l0hhxZbSiWCQcJ22wLtu+79MQPQT4Uci4cB?=
 =?us-ascii?Q?TJq9HAatiWonRkC45Yo1Gfq62hJGcthy6eWYMos8XLZcxcjv7r2Tvw5jQOTj?=
 =?us-ascii?Q?zlIXbCI3cUZhSGKG++YyPW/kk6otFPIOogCBy9SNQ6teaWXCLtiVUM6s83+k?=
 =?us-ascii?Q?cjqsi0S5ajhLfUUa3au+SmYjyUdrLMGWr2itzlh3/13hkfrBP7He45kG9CLN?=
 =?us-ascii?Q?OTs7J6JH50EDd0LJAQ3mYcKYx439wvxPcaJmSSsUquZ0YadV3prj8ZlQ7NZm?=
 =?us-ascii?Q?bAWL7uChOM6f6F/aX+dcHKGEgNrW9r3gzU74SRmUDQJayNws38T47GBblUGh?=
 =?us-ascii?Q?M8MJ48MeZHV2OGW4gIeJZRwWUbyuZ0El/QCA25HsE9JxT6PLhJDOICb5rPtl?=
 =?us-ascii?Q?RHPCB5SC9oUHB4meMzEnM4oXWGKUsAkgoLGNpwpCn+tMdwKJPeYfRuAryDoY?=
 =?us-ascii?Q?XNxG1aE5VgKPewoP6rmNJj7AVk+/rINZkYsNM7jikAJ1SoZMkRCvHMbZW+sp?=
 =?us-ascii?Q?f6h18RQeD1DK2GXccrI3NOeqBK/8glmLFSUzfLkl5Fy11s9OLJQ8WK0Yt0gY?=
 =?us-ascii?Q?gURqaCzS0wgXSDtSuENQd32eEODLUsg33k8uaRo5/SEAaONesyXMZlEJjGQw?=
 =?us-ascii?Q?TQEENXG9Xcl1tZSdlvo57DgBRX1c+8/Toni6U84iNRb8xGyHw1wQ3L2xOx7N?=
 =?us-ascii?Q?GVnG5WcNGZjXwZZVvB1kUkE7LqZrafhrs4TBuBiwJDp77ntaYAlkgZduCaQ3?=
 =?us-ascii?Q?mSSw0kqTEExRF4kyioRPkuYA4/tvTbjy6LuJxfvhuxv3nGfAqjfgzT3/t6e9?=
 =?us-ascii?Q?iDyt5AYM/LHJyHiSSwfTX2azO6rk1qOoBMjktTAiH94RICfHHmhVklO49b58?=
 =?us-ascii?Q?np+/c57FRS7bR8lHhdiZj5Kfjn5FjwRHrF3xJeiINdkzvm57lzX0w1toZaCU?=
 =?us-ascii?Q?HhSkSLsGHhjZ5uqrplidQZnNXvF27NhgGU/kgvvmE2pQwcyUFwZlolcT4Cfj?=
 =?us-ascii?Q?UT5Vyxqhmz87oIiepXIepP7c3TYqOSQs2Tm0eBiC+Dl59Uh7cYsloUOzyNTe?=
 =?us-ascii?Q?VroYfb/pZahMD3IxZy5FmXw5nQ/qkUXsSaFteFhd8ISQW5zgcX2L/CWbfVA7?=
 =?us-ascii?Q?T5h+TH1pgyOUVB/lYH412PgaCSzekCfrX4XpRx1J0lXoRbMbXNaaaGuA7N1I?=
 =?us-ascii?Q?NenFrH+QtEt/J1EqhUfk0QXzT/3kKWx39JIFUh88KHp2xct3TJcpY6zj+PV/?=
 =?us-ascii?Q?XZ7PHU1nYqzL9muQuWFLn0A9mCUtitLVdS9dv0mWFIylC13ZXv8Pss6ew5Cb?=
 =?us-ascii?Q?extRjzKdMIH81yzAlrAuGZkTTZbvOPUwEK2V8UNuju38emsxcbqtyLK1rhoi?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Kpb9tTqVsZu7zGZbTH4D9a4Ie4PulueWntMoO7At/MiZQ9xMxUGi3xJKZn+rXg+SQeMDTQKVIxiYDL0vhQLZ3Rbj7MbRn9UexwsRXmcltK8PXeLTHxkch6l2zlFf3p5sjNionW1M9Trd/t3Euwoohr6qA9hntga++XKTZ2fm536X66HCMWfAJn0sa7263bmi+JLO6cybxPqskMU29oCYrFkmOUYTHSEEc2dXDoR5CX0f6UujVFn30NwMtZoTPmqVnnj4ihV1sfUGHxSRTmnDIQO9JusENYSBDrNAAR4+8Eq+SJ8SQKSp3IZFLKMwO81A8ENyvKE+CND+JTO/SdiNo/dPv5GG5IfqVTmT9/z+Pio0T0fgvTZiuCT4ualhyIyFq/tQa+d6K+ZAqEj5DSjpwDuX4pJ6N4FyIsEYM3snVeylNuowcQsF9v3b7Cv5fTBzPnJVklp4+y1DJEIGeq9yGVjdHnvNzP4tlaIveEE2S3ZDgXQYKWtlu7YLNed+iwraWTohLgfqYYfatA7NLuPgqx8bL4OYqANsqgyZ0TSMcYbcuL4gRK11/c1BgPVV/adDyyX5jjs3AF+AjTPK6fGwLp2C8IOK1NFG8h/JatES/Zw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 030ba431-610b-4789-846d-08dcf82f98b4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 15:37:28.9816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LBg6NNR8+hM7V4pBRpWC69gokv/lXR9BtwKEBsDVRMhAjudByHzfpenO3D4k7OJbTtUwzsZ+Ta8BdZA55qf98wdfoAAqodJBX1MImSURqMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6319
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-29_10,2024-10-29_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410290119
X-Proofpoint-ORIG-GUID: iC3YhHZbBgb8wTJW76IGBvs2QHgZar1D
X-Proofpoint-GUID: iC3YhHZbBgb8wTJW76IGBvs2QHgZar1D

On Wed, Oct 09, 2024 at 06:30:34PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> We can avoid the globbing when the provider name is inconsistent
> with any USDT probe.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_pid.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index 62060b592..3f9e3052b 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -1151,6 +1151,14 @@ dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *
>  
>  	assert(pcb != NULL);
>  
> +	/* If it cannot end with a pid, we're done. */
> +	if (pdp->prv[0] != '\0') {
> +		char lastchar = pdp->prv[strlen(pdp->prv) - 1];
> +
> +		if (lastchar != '*' && !isdigit(lastchar))
> +			return 0;
> +	}
> +
>  	/* If it's strictly a pid provider, we're done. */
>  	if (strncmp(pdp->prv, "pid", 3) == 0 && isdigit(pdp->prv[3])) {
>  		const char *p = &pdp->prv[4];
> -- 
> 2.43.5
> 
