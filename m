Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF111CB50B
	for <dtrace@lists.linux.dev>; Tue,  1 Oct 2024 17:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727802790; cv=fail; b=nhQuFF3bcWp15JWFhBe7HgHnBKq+RKOgtaXeo18QZDkSDCiwnCsmmuHiCBQLkxIvGsb3jbvpSfdDFIJhARcvwSzy9C8esBakXqCcPZAaRay3eqerJZcbWlHRvkrMAYieJRsvwiTvamUxZU2CW4t0RNxMjDeoiEyDysKeNlGV4xU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727802790; c=relaxed/simple;
	bh=a55LB64dHPFPlGfVi0oXZiizEbSj4MVt9tec436Wbj0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iStszRGyM6CKNH/Lc8CvERK9Ry/PPPuVZwJxrXci5Xb3ryfmNXvZeO+j5nst32XTlPbD0EhOKqot7oo7Wlpygrs900tRGAhAGyBY3etUugUItfOtZup2qeGcHQs0JhdQHkit5vw/lu3a1DlXjcWHOtm0yTIc1AzQRQ6OvluhS1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Krlw1o5Q; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cEjlgt0w; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Krlw1o5Q";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cEjlgt0w"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491HBbkp017899
	for <dtrace@lists.linux.dev>; Tue, 1 Oct 2024 17:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=aZw4SqW0X1b25DienKoB+ANwJTfFeUIHufX4l0sPWxk=; b=
	Krlw1o5QVIJQuy8dzG4UBz+pn7OFPs40ij7Kp6+wcYmYy2NT4GreWz5DSJQrImni
	68GTiwk7wKHrzEWNqfT0c7RqkXNRhwXQyVZIHrHRwSpCwIhQp10A3KfDxDYMD32m
	Dhwmim4M2a651XSXYU+N1euGl6XxDHJsa4xGHLy7UkAbVXD1TggUAM5ffOosHHHU
	YOZyI2RT2+vMN5iE8kUFygLTO9QMDURJ/5AbxAeZDtbtJ6hkbM89f0DB9jrrgNo1
	ktmBMa0AclcHFhjp9ODyFzTYVnVEeEbU8TFX1r5b067kACMyCw9Ls7jb2iWgiJSf
	zYDV5/ymfmlz5NL/GSB3ww==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41x8k36wbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Oct 2024 17:13:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 491GFfXi017337
	for <dtrace@lists.linux.dev>; Tue, 1 Oct 2024 17:13:06 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41x887tu6m-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Oct 2024 17:13:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EqUgv7s1hWkeKwsnhRsB40tPbfZ69w1O/m40+xrVuXNgC2TP3Jhse4UcJKnBSl1wa/xqTmutC40ELmFby1DoqYTXYBfpGAN7Y+HbGe/Ll1PsSHblZ+g6iR1H9xSRPcZMDJQJstTtIFaO1gtZq1eK928IpguB70FTRNcTB2tvcKdARBQvtnnLJJRlgO62XhmwpUFnlms7ZFZE56/zedQ06TRHRcznX+Ek6yItOZOv1/fc4oord5xhd+q7WC2oNwTGYIb4eItShyhSVnJbuwyAOvBaz0ABIkXb1Nz2HLf+s8BOWAutWYT0SZcKBQIpYaisnNbRbo7U9vN1o47jho6DZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZw4SqW0X1b25DienKoB+ANwJTfFeUIHufX4l0sPWxk=;
 b=IkkpmsAJF0MKsu3JY2nLD+U1J+ZAVyfWAmp07xdpny/4dPzFc7dupFpFplCHNsx+Ya2/kbd/pc4vVuo8j5mlb7X0dH0eycnQVx5eNLgyGwBdPh3fvwBxdWJvLDl7lfHC4ivmWdFAnOdxeL/bxm/WJbZOJqNknM0ywAtaJdKT9HAg+TrIy4/Ah5RxcguGCxbSGb4nt6rMS7xKxYK2dMT2HtIvEO6MT/YINMAioTL/dsCFBlNqmH+jNMAflqHACrNPvA9eBTrY+IFSJst7qfyOVUR85prCPBvyqs2GmvPl7WZQP/Fa8/p3w0pHx8RzlPpLIO8yFz3glXoV2Zy+HKmpKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZw4SqW0X1b25DienKoB+ANwJTfFeUIHufX4l0sPWxk=;
 b=cEjlgt0wz4+fGZeM4QXTKYhAmJMFwwCllLfzlvAWzHCmkfYmDQ5jZxWdhlb/NO9JoVDmNeX//aMcLvA3YI3O7UPT8u9YRmt0qK+Qhr56NqiOdfikbHrrqIjiV9REoGIjDMNMoq5kvBASalEnzNo06x5FsbhTqhBvSnS9a4YvY+M=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by BN0PR10MB4887.namprd10.prod.outlook.com (2603:10b6:408:124::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Tue, 1 Oct
 2024 17:13:04 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.8026.013; Tue, 1 Oct 2024
 17:13:04 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/2] ctf: fix config test
Date: Tue,  1 Oct 2024 18:12:52 +0100
Message-ID: <20241001171253.426429-3-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241001171253.426429-1-nick.alcock@oracle.com>
References: <20241001171253.426429-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0056.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::7) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|BN0PR10MB4887:EE_
X-MS-Office365-Filtering-Correlation-Id: 58a34d77-93e7-41fb-60f6-08dce23c4fe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ywQn2j5A/unXW7h+pdbeSL32G0xKckw2mp7pwGQw+JRRCBxD7nbh8ic+Gqhm?=
 =?us-ascii?Q?Mh8OxyJV3wIor+AUxFeI6CFMe98/LDeLPp3TInm5aMZ+wiOzP57kS8KK/LaB?=
 =?us-ascii?Q?m0NFFwgcNf28ne9m9fzB8KZ/XUqW9CNCiRfi4rQwgItUgQKPFaTdhWI5dE5I?=
 =?us-ascii?Q?nDviEaCqYXlHJWddktvG9wIxCEQcAyI8j8mBe3wXpUHfXTNSSZGfWBdm2GHL?=
 =?us-ascii?Q?QBS7zPnyOXGRJPzVO+LcvMajuXbULf5mvV0n/bmMomhDaWPeSyI/9NeZ84cH?=
 =?us-ascii?Q?xBwiYd6kN1vT4RZjEI72ySmocsmhU5ArWq28mYkLB8JyG/1S/hGiry+LT/GG?=
 =?us-ascii?Q?6tpCWLGMR9QQEZtvmhA/5zrAflsmUb6dcEHSPwhDOaTPb/oNeRHdc7Bn3JiH?=
 =?us-ascii?Q?0/7B4Y7XYHrUQvYuu6t7daTVyh4f9LdojITRd0HW+NQBl6L61zEF8e4JJ55w?=
 =?us-ascii?Q?H//UuY6nGYlDY10raPcB3rupOSEwKMomoabvluQ6qSdZdom2KVQ9zaewMJUj?=
 =?us-ascii?Q?a3tBhispODGdF4BW1+JN2ZwsJsgUCcmJnqwnjEoCaTe5iT5F3yeYtELzJAyg?=
 =?us-ascii?Q?T42nh1jJDbsaLfEqFKLnkArG2neyCIVXJn8tZBa5LlHssU4ioT55j9Vyj1pa?=
 =?us-ascii?Q?a6GNH0QV6c9LbamLzvM6KpJtKuDGhxds+THgkfQjBnHkRMMgk6iR+YAmgjJl?=
 =?us-ascii?Q?8ehyLiKrziIsKlD0eizXdojRVCiytcF4O2AIwUC0Xo+/eVLt41YE85t84coY?=
 =?us-ascii?Q?MLeOOGffXVlhIICQXnDn3DZtZN3CoR4M9osNj8z5uQ7G3suZ7s2hs6cTL12A?=
 =?us-ascii?Q?eTlghRiu9WPZLajCS5j/H4RW4vjUMJjC6UOT086m8ckKkg4TmWXtJWAC6UEw?=
 =?us-ascii?Q?gDf4otny9IL3CupX1wRQ6H2LHXA295pGjiO3lycOpTirAHr9NYO+XGKxNrQb?=
 =?us-ascii?Q?Tmr67jzMktn6Mn9CCbrOulYclcsQQLFkq/2aNWhBB/3cHYxLv4Byg3Cu4SSs?=
 =?us-ascii?Q?USXt8CZB2LxWNPCqIweI7BcCtB3tm3IUEaxts8T6xF5fXsvjEUMoRrvEHO+H?=
 =?us-ascii?Q?/s+uBow5rx5qt/56e2BrAbBOF6hCKOXwh/40HZ56c3gFomy/ZB2/8+YZ335L?=
 =?us-ascii?Q?tdfSnuDSYYXCi27qg3hef1HY4A+mTXo4yMS7iwhYDLHwMstKnL5Mx/l0VfJn?=
 =?us-ascii?Q?soUrmYauAT7bKasU3BQYQc5HSSIMNNFxSHROiW+Tmwjgkq9SlkJlNLovGMZ2?=
 =?us-ascii?Q?mCjsSk4zXnkcffKy77lBohTykf4/7X3QGArFdFqWszc2ZjbbPtXlc6scTyJS?=
 =?us-ascii?Q?vlNjC2vP4XTReXUG17jVZTXNdSTWKDYG0lv5BWhOVSPkOg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TESsg59fuihIRlkp0I+5tUqpCp9eTmMWk+yRwujzwP9ZxD43TXtuf1rp4xJg?=
 =?us-ascii?Q?HlFPpXO8049e2F9SSvOCfzVa5Xn8aFLqdn/qW2hE7XcuKXWhOhHPnk/zQskq?=
 =?us-ascii?Q?48TqTnqCJWpvaU4B41Xs88L1/MC9dLkywg4ZKaQrcMHHKgc+y1eG9lMmFSt/?=
 =?us-ascii?Q?xPA+peKtO6p6fJBqs7Bpz0xjFmCozAlCi06vxn+EXMvL1h2yFZPmOwyVZ8aG?=
 =?us-ascii?Q?1cdj3HZzZ69aW90r+cGrV97mWmo1LADD7U4PqWf197CLk/PgTF+yxBGim16W?=
 =?us-ascii?Q?i3yynbes2Hd/8y2q0+pHevhmI1iZtSWnUvq4LURDK55TjRSAkc15Gou6muJu?=
 =?us-ascii?Q?pUMG7E7spAKpLF6LMoVEPs3kfGQSDRxX/pz/RXx4Y7/V5pVf+L0K9LXAqltM?=
 =?us-ascii?Q?WGCGobgsBxLawbHgdciGwR0MawHgq0fC8MYqR0A/PqKK0yq8UZvjWIkFrA5J?=
 =?us-ascii?Q?I8EWzk+QIX+HFIAosihuLtvlTCHILRtrQHn8qIXTR8oNy5+IQlProHX1/COB?=
 =?us-ascii?Q?J2pyw7rzUjeAUdThcCl1egUqxJjt6UJjnVLgdDAKFkaEqwXV18JgUUICuoTF?=
 =?us-ascii?Q?GvwBR1f04JBr6tCQPXiPvoLaCssRjfvGvINusVcb9y38XORyNAS431ZSw/mr?=
 =?us-ascii?Q?kkHAdx97vmLXbUYmJgqtIXajEv3x3QBr+io2rYOvHGUeRBXl3g0tJt7O5aaY?=
 =?us-ascii?Q?StE8/g+GCCZT+f7LoxR3e8z9RGKBh4VqXsY6eAuu65EOu+Kr0OYuAVgAMIsw?=
 =?us-ascii?Q?gvsKOc5yW8RY5+RSIy9i6Tgv6stuN2t8eyOfJiL3kpneoh66Z+hgEmobTxG1?=
 =?us-ascii?Q?goUi8nBG5gebyKhOQy4M6XHjyWwa66Q2zsYgOD4azIcDEKjbX2QVBljYaznT?=
 =?us-ascii?Q?H6c2s6UTSDzeX4ildGyLa//MVfFR/U4gwvqSkhFWLzkyHygRgdKk7cZVYJ0n?=
 =?us-ascii?Q?WfGU14f8WnNok9FibQLWwpVZJjBATf9ZHqUlvmpcLYl+3dIILXuT/gsRn1eG?=
 =?us-ascii?Q?23Fs2xIeFuvaK8hWj7drjnLo0pRP5XiSmKfxpNQNc287n+TcIlGEkApQ+gRu?=
 =?us-ascii?Q?ydlV9vuYfdUmk8BtMNd4IFX4wqozqiUNGduZaPXs/yI8sahwi5s8LJHnZc/o?=
 =?us-ascii?Q?9/lOacf8K+OyKPNm1pRiWK4c78Tu1rQeYjCj8BibvZSfK1cpoCdXhp3BKjsL?=
 =?us-ascii?Q?lchF5U1HaQuCIs4Xc8CgxGJgrrTnCcbV5C4BsyW5pah97M2xyKv+IeWQ2Ob3?=
 =?us-ascii?Q?IeoRw4QcWFKQt3XjfYxvjxZjKZbZgPHN0ZB+evgkeRq27pi82DD07lMzTR2o?=
 =?us-ascii?Q?mv0s7XvwO9rUXLjev5+u3nesCXB6cYLH7aEMehvefCkGhmlM7oasbYwz24IV?=
 =?us-ascii?Q?46GeCEF5/CG7ytylkez5D1HZS0bpFmkvDbK69Bwh3DMHXgI2JSkPq0Ys93YM?=
 =?us-ascii?Q?zOAPaOAbtxxwmp9Nn+9HDDAnsQBLwn/9anKVy68WdgQeknvxg+teDxqaqjFj?=
 =?us-ascii?Q?aXPKFKUi1K9Dk0pmWDVCFIKC7ePZkT/b5CtTcdjbGb/+wsH4hoMG2UGka+9v?=
 =?us-ascii?Q?4Dbbx/dIfArFoWXoWGSnUaOYKUm4MLDTEu3u2Abeb8vLt7TuiX8EB6e3jagQ?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Xqivn63DuGeoQhOZxNxv8jv4XIG3Z5wr+2cnctn92TRqwmU2ulp7v9Wp3fZa57KEJ+2hIAmL01lj82pbYWU0RgB3U0UxXE3pHTYArNtKvKv0qaG8/y+zJj6UQG/lv9vbis6kczBltue4CduCO7tu+nQyCjE692hgE1WaUjW+n5g7hNch+c4KuicGYNCrpOdaWwZb33VLZm/9fnNLNecHj4na05tR5XIY3Ke9FwrkIjufaqDmVjQMzdR/W6azJ7Tw0VSUAS9nLVT5w+eEor3E9t1btISaZbH5kNWx0ITt7d1W3/oMUbxh9qeXBiSyehs4O3pJrnNsVB4RCmc5fJOb1CRxugBgMurQmOQnDhDu0bCw6+GpIC07eo1qBHUudkOQhOy7OW4bbdUGrRLlbMljFd2CKMGMzjNILi5vvbgwCDg4pM3ZJQM1uq2A+0t59Ya3ewXF0k18zu7NdzN+sc7vWhfBUxZIFqapyAj/6VgqS9K8zddBPHzOjuTJBXXhLaaqv+hpXQw26oFnVimGDFHFj9ZAJR6H0vc/u8z+zQM1851vxTgPRzKlBf4+coh/rBX0k1ALy7QBJUwzNUwcdfO8wXjWwEfGVpEiSboR5+N0hMo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a34d77-93e7-41fb-60f6-08dce23c4fe8
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 17:13:04.7193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KBTlwL7d7TK1xH1KZNubMRwZ28SC2WFwmn+sccnnyzN2ijHnYClk12hxlYxrSvUNHVFutf6NbGO1yT3mP0sdAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4887
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-01_13,2024-09-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2410010110
X-Proofpoint-GUID: YHNe3OnbGxViJ-fbf5XY6_KJ39T47p1-
X-Proofpoint-ORIG-GUID: YHNe3OnbGxViJ-fbf5XY6_KJ39T47p1-

Using ld-option was producing a dummy a.out file due to a lack of -o
/dev/null to redirect the output elsewhere.  It was also failing entirely to
work with lld, since ld-option passes -v to ld, and when you do that lld
doesn't even try to link (and ignores all -l arguments).

Easily fixed by avoiding ld-option and doing what the ld-option macro
does by hand, without the -v.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 init/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index cbdd7a2d46b1..4a6614f4f453 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -121,7 +121,7 @@ config PAHOLE_VERSION
 	default $(shell,$(srctree)/scripts/pahole-version.sh $(PAHOLE))
 
 config HAVE_CTF_TOOLCHAIN
-	def_bool $(cc-option,-gctf) && $(ld-option,-lbfd -liberty -lctf -lbfd -liberty -lz -ldl -lc)
+	def_bool $(cc-option,-gctf) && $(success,$(LD) $(KBUILD_LDFLAGS) -lbfd -liberty -lctf -lbfd -liberty -lz -ldl -lc -o /dev/null)
 	depends on CC_IS_GCC
 	help
 	  GCC and binutils support CTF generation.
-- 
2.46.0.278.g36e3a12567

