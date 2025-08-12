Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6901C3F9D2
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 18:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755021820; cv=fail; b=U2eZJ+N5r3Vs8wtsgQwKEGTTeifvP/2fwOhaf858JiidKi0xNaK3cCWxKk1Gqm3QpSFHhIpnNuHSsmO7tj2PrY5amjr9IgHKdgAf2D9Tn7RCT0VbsGkjnVIbYY7wxn/NSugfDk3VtI5fVWHOazJ6yxL2Q3bIT6u3S148Mnie+cQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755021820; c=relaxed/simple;
	bh=X/oxJGJAXdihYkjsamIaBpFFPmaBBZCBtsGrFb0LKb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LEn4RqAJqSa8IyVYg9WQDU8Wicp466SQy2OCajqx7MValPdms/wCqUK5bVZ3q/VQKK6v1kGki02x1uciCCmsEuE4pbVCVvGW+AADequtaFuKPPwGxbtFBGKdC2p7JMMfYpItfsKQ9Uv0qCzhKX+RunULNQoR0C4BM/+d7qUPyrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kRL3LJSa; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dIJhEu0K reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kRL3LJSa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dIJhEu0K"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CDBwS6025257
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 18:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=3O4DN3j13HJct9D24yjvN1WieK9XlPYrIYskkc0YNgA=; b=
	kRL3LJSawQ5Mktc0tlZOo/WkA67n158C8kkLApl44SoN0Haw1RTwRPlvUO6lIBXH
	W72//OCPYmGH+aN+oHxM5+NDD+sGu5ouBjUGuESn59+0gyDkjqf6DiivS6/F9PEl
	4PJ0ec9d0uHTfXGWz/tvK77HS2acZ2nE1Qu6qy/7QFB3mZcxPiBHgW05Qyy5vEDW
	g6A1F3h6Fv/Anva9No5oCy8JB82VinlVh1QNa3P+y+x72+vkinhm8eyWoowgD8rE
	SSy+GxC/hZt88j4QZIUD4bWRFpaMR07C9NgNTbVBw3YfmnPJsTJPFYYjJxsBWmtZ
	WynPL46r/JjCcIaNV+4tjA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dwxv59j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 18:03:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57CGxgRJ005836
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 18:03:34 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsa3tva-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 18:03:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xPVjySHkCx8xLl2B1PJa24IZaTiQV8cnQoUYxDf4A3DlzH7rtqZG01cKDKGZmqkgmrojcFxsUQfiR3tWk2+6/Ll4N852PpQ5HfGu2NBnHTdXduMsJCPyo3A47iwYvPvzRmMqptv4spt41DVpRuRK+h3A15Fw+zEJSInSIq7yk7w+aAu/FDhan3UxXUPblDt8rj3suvf9wQzhJ4puCB9XVZ/66qKHB6S2Fq61h8v3yG7EktNRdrhx6yz7xdWl0HoU5gr+FyPdBNS2F6axWM30vz0tXMLkIOPzyVKsa9q2mOLC02S98feA411dlXuc9yuqECPOwK1IFXj4M4/82LwQ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NWSLysJYUC41bB1XhuRrdQd57gB2yWNpC7OpEVYod8o=;
 b=IZqD6pv+wrnSC/tNbjqVKybc9O0j9Myf1Zvpm5hnRSUTw41zHq1Vlklh7kNkxrn3DXz6xyA5IrzLN1vJolBrMTCLynWitWVvmh749HwWY7tHhv2RBEdQIDwfgGVxBYmVoBumOlfZ/7QLhCSh5idqhAXp6ePW4XrZTEdMD7di2vXsXPBsPi0pCm4N+MFSGuzQ16BVxVvzGWQKS2PlygeWHewfKKv7Fyya2TWzvTGcKNx1o63VHt9oLjewekz1NHa5svFZ/Kqup43PX5Tj5XmOO3gV1+T3VPZ5BBn3cLkrZwZTFVONBtbmTGDS8eVxZlQUad3GCcFDV/dYVGQz8/R0BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NWSLysJYUC41bB1XhuRrdQd57gB2yWNpC7OpEVYod8o=;
 b=dIJhEu0KnbQbdJzLiauSg47xuLIXCaKhl0P8SVhEFEnaAmsvo1t6XLZcEAXH+iy4mAHa45ESrL4GLeU4d1Eihlii5JM+EtzuKXBh/McpD/AvPIkp83QXzef9L28av75pymWbc4fIAIufJzuFSnB+AAS5h4zSwWSh/Mto5sFvfec=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SA6PR10MB8160.namprd10.prod.outlook.com (2603:10b6:806:43f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 18:03:31 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 18:03:31 +0000
Date: Tue, 12 Aug 2025 14:03:28 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] test: adjust sdt.tst.args.d for
 task_rename tracepoint differences
Message-ID: <aJuB8FBHT4JdV3U/@oracle.com>
References: <SJ0PR10MB5672305D781B114488EA0800C22BA@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <f5760136-5c80-32d9-fcab-dc1dd51c976f@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f5760136-5c80-32d9-fcab-dc1dd51c976f@oracle.com>
X-ClientProxiedBy: BLAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:36e::7) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SA6PR10MB8160:EE_
X-MS-Office365-Filtering-Correlation-Id: 93ccd2b5-139a-4b66-543f-08ddd9ca8bcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?XCDB/SvT83wJH0y4Ie5PxYfg2wCIcRF0pqzyPb9aVFbfBhwCqqZEhBDTxg?=
 =?iso-8859-1?Q?bSWdDe+tvu6FWhQBoCPjl1NcySbqu8+y8LdZbGHuwWGz3lZaTVC7j1UtiA?=
 =?iso-8859-1?Q?iRWFjYYyPP7lj59hiHKa4dG+oCiAz8nZuriQnFaHustg51sV6CMW9PZ2Nq?=
 =?iso-8859-1?Q?fFZDncNjW5qqFu9L1/myZbV7zo7oyuGOl5dNcE+ofAO390dHsGbDxnjwuL?=
 =?iso-8859-1?Q?ChwMnXKEv5mxHHReNZBY6A4WmH5LCTUX2Jwk5c+iuVmQpVnX5Wcj/umo/Z?=
 =?iso-8859-1?Q?AH+tly8nfH+1Ag/u49uZ78kzuRTOfpebL6G/uQpKlKgQpOah9Vxy4uA33C?=
 =?iso-8859-1?Q?dsByEU/T+EMQvgLl/+SNmQdxmlFsVwXRQ3LcxCQSzrjmWW2SqK6or+y17S?=
 =?iso-8859-1?Q?DjG0F6pGE0ogCT3V225T2Jc7YItAfv91S1/biSBdIPs/BglnszHYr11i+N?=
 =?iso-8859-1?Q?iSu85MYIY7xSjcB8+sZ3Qn9dJMa5QQmPtNe1CxsjgIS+mJ+fPXAyzVkvlT?=
 =?iso-8859-1?Q?TRj/FYzIE2it2fy4LMXiG/kSS3IniPfH/P172UOQmt0PgykuSpJQJCVX1J?=
 =?iso-8859-1?Q?8N+ZOx5ryY5098Wvl0KNjo38jExOcghfjc/4IhkMZlCNE5p412l93rvXtF?=
 =?iso-8859-1?Q?NSinjiXeuyDtu+d8CS19tiBvzxPCSIB/cJrKoJJ8u+tCfEGNrssR+7v3aG?=
 =?iso-8859-1?Q?yCyLuUF3E1R+PHOo4OrR6giYNBztLF2GLYweBtFwiWGgPLuvZxcuTH+7ph?=
 =?iso-8859-1?Q?HN4avYA7+xPM0KF2Py1LK0qZMf1CCg4F/5KI5qvlNKmxIv8SCauMg5FHBS?=
 =?iso-8859-1?Q?RRNBTUjM4iun00kJftaoHRf1aN2wUTqA1WHo+WGb4MAEhhzp2+dLoJsh0H?=
 =?iso-8859-1?Q?kwbvom68OTflB2lrK6oH1YcYk4dzhglnXIs5Z1kZ/7JF7Rr8wP7N7cB0FV?=
 =?iso-8859-1?Q?S96Dz1l8ug/rIZIbE4E1X26m1zYnIk9SUgK8CpJne3c4DThpzYPEAfyekH?=
 =?iso-8859-1?Q?1kOfNtACUAPQwYT7KaxWFkmhTzclqBfs7gtNTwLEdTfJVMHn6inOFXjsrL?=
 =?iso-8859-1?Q?JZbaImIfd86Qcyc0ny9qJaSDRPs7uNhOb7+u5HhIDVj2mFD5stil6812l9?=
 =?iso-8859-1?Q?QiStye63nYa78vLzlB/xeZdlGFb5dc5XhumKpOmeeksrp1Q1VrsLNhvYaV?=
 =?iso-8859-1?Q?tTMOcNbbxRHqu4mAv/reXGWnWkm2fK238zFblXHhjaDqcZvU2qfGqYoPxl?=
 =?iso-8859-1?Q?6oGpcB+DT0Js7KmAU6Fm6zLjwHMEpVylzZiWnvS5aO9yYZQrUMZVrw3GY8?=
 =?iso-8859-1?Q?7XN8vKDNoUvXIeEL6Ku5sQ+bodmJSM1FMHe9Oxcsn59RGLmTqTufaFM0bU?=
 =?iso-8859-1?Q?qghZqb7diETrT8CeRznOILASfIXJZjyf52D/oMTGBNFknPT+Ygvlrr2WAK?=
 =?iso-8859-1?Q?IUS0aXT6e7EYhDvFX/DmbyReeYPunjH8vJEREDMdgg77hIuyfDWbd5M/Dw?=
 =?iso-8859-1?Q?I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?5Z+xowgkU6YRokU0hKuky1OUZFnEDamolhBv+SblOwQ4CYZVf9VYgPAWCo?=
 =?iso-8859-1?Q?/sNbyxRcitUIr/yEeQBwVT7NN0DPYB4BzVb9veAttITTk2LGaA8NGuinrl?=
 =?iso-8859-1?Q?q1Ah2AQoei1TvdHu3pSC1GqVRLjI8t/lSoVfmFqAYKV5HdL+qHyX32DB5P?=
 =?iso-8859-1?Q?dGKGesRyQgOEQw843nqrHezmayl+JmiZpaiYvIiFtlY/zk3G00YckNX9lZ?=
 =?iso-8859-1?Q?fL0RTOR+uWvK6f/+aa1RNjjpVe1z2mUTeSG66lBw8qm+3xBfAZuUm0V0E9?=
 =?iso-8859-1?Q?crikcPN86mkBkO1LW9AhlyHhxduC5mBWrlisR2+bTeTNnRuIc+3eDOCbJc?=
 =?iso-8859-1?Q?G2FA6a1uSc3PRAiQCo97O/PXX/MrrjLOUHJCaDann8P381rwrGZ/lp+nh+?=
 =?iso-8859-1?Q?B8tTqvLm0sD6KTSpF7FvWTuYebuoirwS4bhInJdZi3IUjziKamdfP3dyob?=
 =?iso-8859-1?Q?RVavqZSXkD+kP/uNxhv/wxVjz96LJK2JdWhBboRqAKFz+spUofUL0V01Xx?=
 =?iso-8859-1?Q?Gxx5pZHO+F2bVM704YxooNn9k+b83xe3Z91b2/Zf31XB1RpLFlbOjDazhy?=
 =?iso-8859-1?Q?g1OslX7LcIx9vPciyBlgT8AbUWBySbuaA12cjPR5vemnoFcA5/lMs+YnCv?=
 =?iso-8859-1?Q?76EP8VxUcivnu1DjOFIeCspD68KdRqVgDHoHw/umYSsW5Y4OgcFdAyP41s?=
 =?iso-8859-1?Q?9D2SdxvpZfvSGx5tm6qzfqlQWUNgaBXu3SZU5zGLbaBADNw+JtAG+zef7Y?=
 =?iso-8859-1?Q?4m2Wn1KWwOVvigS2HN/c9XNXY02IOjdS5JTTvNRXgxhhiYrswQIMmxhIWU?=
 =?iso-8859-1?Q?ILFyihh3eqi7ytauhv/trv9CNM2DtqbW/bksVUluz6q1AGsgLW2sB6urWo?=
 =?iso-8859-1?Q?N7g2hX0xtwgzn+GtApPMzBAID5DrXPFMLagJ0lwASyiiC1sraShZrRfmGZ?=
 =?iso-8859-1?Q?qVPvvdOXb4Qkd+ClRxA2MBorHUd3Als6OFZg7L0rxu4bcBsCFd7lFKUrDf?=
 =?iso-8859-1?Q?HATFKJxZGkxCdQyKlUaI5lY4c/Z8mGhA4CCEHfCa9aKKSLlsX62CdVqli5?=
 =?iso-8859-1?Q?SAVcLlePu1PAuor1wvpEd93gwCfB+4ULLdydfO0fYqQgc9xcibey4HFDNY?=
 =?iso-8859-1?Q?/+nIZnzW4V+B7N7rCwMSB1NsDpKVLJ9vbS6RLsBp51mb7BmURPXksBB5w/?=
 =?iso-8859-1?Q?ItIufOFW0DzO1dO/XBX3NYdRYW/7534enHrd6zuNRbAzweAU6Bbv+3w3P8?=
 =?iso-8859-1?Q?FrAOgpJoBOikihf+M9PuRQadphRqNCpChwodiR9B1hYRKT9aRjGHrt7ARg?=
 =?iso-8859-1?Q?HsldhQZ1y7GPyB9R45HGdbfS4+EFwE9fFODBCwMTNI+Kn5mJPZptlv+HOw?=
 =?iso-8859-1?Q?gWVztxN9Z/aHuItlYH/YqhQLNsQnEvU96orke5PikiBVndJK8YDOS9kzXq?=
 =?iso-8859-1?Q?UpoZRX3VE2kljhK+nz7cMSbH9oL4juSBYqAl8SIRdqzWswFf48WqdqW1Qy?=
 =?iso-8859-1?Q?ZWkDSDnkvQz6ZJYp5iFjNTBUUeQn6kLowKP2DI/vfCvEsaSRSpT645t/cN?=
 =?iso-8859-1?Q?Xp0E4SrRU8l/OP8JLiUr7M82ro1ax1y7TZqg423HaIGV/u5f/MmafOKRCo?=
 =?iso-8859-1?Q?+SMEjJ9sB69CiZs54G3Ws3ehxeS9rzm0vdFGxAfM0u9dYQWRrjd9sG5A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Xm7GGhfehj5hb4dttdBnDbMb8DuGwFvIb5PsnGwxgWp8/4uxIwbpUbA0zU575ksFdm27h9zr63UOwdTlHMQh4AX0IbLGxgjmZp4enHXna9HcE0NXDbWx3oz62o+p6/MlNgQkRkgR50RdJi3A/0YOwnuURsMtG4VwC2AYWPG4nRg1FOMqzmiyAk8clXzVVPHurv1AA60WM87ue7hfX1tXL0SaBBmD4jwX9VPNOjwf0oExRWWCkkHSYoSzy0jbuh3edBB7rCQ7jBAKkinEtnt/7ULk3z6AXvmQ+Wt38Dx84xNU2vlYCE1x3Fn8eZ++2NRl36eV16oqxaXyL8G9IhTsnGjn5qBLI0k18m2cEgy77FAxbarzsmjoOhUMDDFNRMo9A9hQAJ56Nwg81kkriEtJBk6rfm+QZHhNMd7/lqL8Mt4qm3+OU3mxGHTeFgTpOX7EbTLaPk7yT8VhlVDO2Pej7oQ6mjVCaJ6s8Ic8Leto6QMLXJ4y27RRkKKAHh6nRcHp/c7fbd1BngcZWocrJmYAlkXVxefbuYOzGHUEE2f0W5cgocyQiJkYM7xKgouk7xyMb6FJ8RFJqEoBeMWJkR6G4WyAeqiqW8TDk2WVD2k7CQs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ccd2b5-139a-4b66-543f-08ddd9ca8bcb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 18:03:31.2218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /18v/Cm+ndn2sPZJ8AVRhdOlEG67yP7LuXBOyhlZtlMGWmb+FYBBs3izOdqlDw+8qC2eOQrilmu1OlPUqG+V2GRb8kN6MZtCn24OJkyLED4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8160
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508120173
X-Proofpoint-GUID: I4N6a9HzS40QEr1UA1_MUbGZygWTF7WL
X-Proofpoint-ORIG-GUID: I4N6a9HzS40QEr1UA1_MUbGZygWTF7WL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE3MyBTYWx0ZWRfXyh2ZTviUHmnw
 Bj51WLVujrLPQwuwBZPYhTFO3dDcMoA1pmPV40itiX9V9XavorKMirJFQ1xlAUnIzkO99s1YzkL
 x49YqyxjJW9Pq/Szef2Q/KQ9hqZMB7QBiOEsCBVo+AfWit2XjkFtVCy4C0f7nIk6GofB8Yom9xz
 eu76a2amsYfchtqBBHSWMLkiArF35LiZXRAe9FH40YyE1VA3D9CcvK/YXtui7YVfp/+96EkcBgS
 T0eqWJ09miCH2tmMuhIRVPHpdYmL79rYrfDm+WFUrQtO5YfWSCliA6Zae7t1MM7tI0GjC+NSnaC
 z31DZr3kS9kHJpvsolp0PVTxXV09Z4EQQoF9qMYvlc5hUv8WB49b3oiQ3iZ70YRkyCJDAUXUhB7
 /NMmOLO7uD7mvWAK3bmZ8zF7RdwJp6sP37P9aCIbVid+Y0dmi2LZCRbWGBpeBkFUR0d9QgMk
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=689b81f7 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=lSNhpNMjmpiVsoVS_aEA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:13600

On Tue, Aug 12, 2025 at 01:54:22PM -0400, Eugene Loh wrote:
> On 8/12/25 08:41, Kris Van Hees via DTrace-devel wrote:
> 
> > As of kernel 6.14, the task_rename tracepoint provides only 3 arguments
> > rather than 4 (the pid got dropped).
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   test/unittest/sdt/tst.args-3.d                | 42 +++++++++++++++++++
> >   .../unittest/sdt/{tst.args.r => tst.args-3.r} |  0
> >   test/unittest/sdt/tst.args-3.x                | 14 +++++++
> >   .../unittest/sdt/{tst.args.d => tst.args-4.d} |  0
> >   test/unittest/sdt/tst.args-4.r                |  2 +
> >   test/unittest/sdt/tst.args-4.x                | 13 ++++++
> >   6 files changed, 71 insertions(+)
> >   create mode 100644 test/unittest/sdt/tst.args-3.d
> >   rename test/unittest/sdt/{tst.args.r => tst.args-3.r} (100%)
> >   create mode 100755 test/unittest/sdt/tst.args-3.x
> >   rename test/unittest/sdt/{tst.args.d => tst.args-4.d} (100%)
> >   create mode 100644 test/unittest/sdt/tst.args-4.r
> >   create mode 100755 test/unittest/sdt/tst.args-4.x
> > 
> > diff --git a/test/unittest/sdt/tst.args-3.d b/test/unittest/sdt/tst.args-3.d
> > new file mode 100644
> > index 000000000..ae070cb72
> > --- /dev/null
> > +++ b/test/unittest/sdt/tst.args-3.d
> > @@ -0,0 +1,42 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2021, 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +#pragma D option destructive
> > +#pragma D option quiet
> > +
> > +/*
> > + * Ensure that arguments to SDT probes can be retrieved correctly.
> > + */
> > +BEGIN
> > +{
> > +	/* Timeout after 5 seconds */
> > +	timeout = timestamp + 5000000000;
> > +	system("ls >/dev/null");
> > +}
> > +
> > +/*
> > + * The 'task_rename' tracepoint passes the following arguments:
> > + *
> > + *	char	oldcomm[16]
> > + *	char	newcomm[16]
> > + *	short	oom_score_adj
> > + */
> > +this char v;
> > +this bool done;
> > +
> > +sdt:task::task_rename
> > +{
> > +	printf("PID OK, oldcomm [%s], newcomm [%s], oom_score_adj %hd\n", stringof(args[0]), stringof(args[1]), args[2]);
> 
> It makes no sense to report that PID is okay.  What is pid?  It isn't in the
> test and it isn't in the probe.  It is only in other kernel versions and in
> some other test.  Emitting a PID OK label is not necessary for matching with
> the older test since different .r files are used.

I opted for keeping the output of the two tests the same because it essentially
is the same test, just on different versions of the kernel.  I do not want to
give the impression in any way that they are different tests.  I think that
having distinct output may make this less clear.  Since it is a constant string
in both cases, there is no downside to this.

> > +	exit(0);
> > +}
> > +
> > +profile:::tick-1
> > +/timestamp > timeout/
> > +{
> > +	trace("test timed out");
> > +	exit(1);
> > +}
> > diff --git a/test/unittest/sdt/tst.args.r b/test/unittest/sdt/tst.args-3.r
> > similarity index 100%
> > rename from test/unittest/sdt/tst.args.r
> > rename to test/unittest/sdt/tst.args-3.r
> 
> Again, PID OK makes no sense here.

See above.

> > diff --git a/test/unittest/sdt/tst.args-3.x b/test/unittest/sdt/tst.args-3.x
> > new file mode 100755
> > index 000000000..80c135543
> > --- /dev/null
> > +++ b/test/unittest/sdt/tst.args-3.x
> > @@ -0,0 +1,14 @@
> > +#!/bin/bash
> > +
> > +read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
> > +
> > +if [ $MAJOR -lt 6 ]; then
> > +	echo "tst.args-3.d disabled on kernels < 6.14"
> > +	exit 2
> > +fi
> > +if [ $MAJOR -eq 6 -a $MINOR -lt 14 ]; then
> > +	echo "tst.args-3.d disabled on kernels < 6.14"
> > +	exit 2
> > +fi
> > +
> > +exit 0
> > diff --git a/test/unittest/sdt/tst.args.d b/test/unittest/sdt/tst.args-4.d
> > similarity index 100%
> > rename from test/unittest/sdt/tst.args.d
> > rename to test/unittest/sdt/tst.args-4.d
> > diff --git a/test/unittest/sdt/tst.args-4.r b/test/unittest/sdt/tst.args-4.r
> > new file mode 100644
> > index 000000000..52854c0b3
> > --- /dev/null
> > +++ b/test/unittest/sdt/tst.args-4.r
> > @@ -0,0 +1,2 @@
> > +PID OK, oldcomm [dtrace], newcomm [sh], oom_score_adj 0
> > +
> > diff --git a/test/unittest/sdt/tst.args-4.x b/test/unittest/sdt/tst.args-4.x
> > new file mode 100755
> > index 000000000..74a0234bf
> > --- /dev/null
> > +++ b/test/unittest/sdt/tst.args-4.x
> > @@ -0,0 +1,13 @@
> > +#!/bin/bash
> > +
> > +read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
> > +
> > +if [ $MAJOR -lt 6 ]; then
> > +	exit 0
> > +fi
> > +if [ $MAJOR -eq 6 -a $MINOR -lt 14 ]; then
> > +	exit 0
> > +fi
> > +
> > +echo "tst.args-4.d disabled on kernels < 6.14"
> > +exit 2
> 
> The < should be >=.

Ah yes, thanks.  v2 on the way
