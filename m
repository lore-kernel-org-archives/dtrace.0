Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3211E882B
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730290376; cv=fail; b=guUC8WRfUmT7HV0i4z0dYRBkRYoqrJ4Z6YDvVkfoBOVFFx64YKhiV7iG1FRoefkmmmcoG1QhWjZ9zI791ZuO/O6RwyTd3ba2rKl7plGQdskjfSh7VJZZZMqtAsLK0rgce4uN/L9+HQjmsdlhQppLohvOqkIJVGdJKdD78oOknuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730290376; c=relaxed/simple;
	bh=CZTCGfxmJw5UUB09l4SvtDt6Nf2ytAHAWumFeVCq6pU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iyOF/8zrY0Y3ozQJ5Dm7UDfMmiOyz/Cv6fPOGqb/2dv7GG40mSPjeSOgG+RRHhxcXFze7n3u1XKPDDmbA+TaxLUUPvbDcVliFibKPZrMZGjIZt5lQuIpHkxwRY2NL2IDEM4CLXgDaVTPgWDtO426tLaic4cv5CMTOdWqBmCQEj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZwAgQ73H; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=m9t+8ed6; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZwAgQ73H";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="m9t+8ed6"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U1htkF030237
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=WV24OHtq+RAtkZ8Mv8Ch/xUs6hbAz92KObIyIZuPIgE=; b=
	ZwAgQ73H1dff+PXuaMBLdgnBEjsbVf7rMsMfMv/tV2LFDv2tHWGjWhTL3IJffnCh
	gH5Qsm1mywZzOBS8ZQn0xOb9t1aMxhR3iXLA2Ru5u746sIpOmD89FGAKaJNtEkVO
	gM5RrSbAYLJ5dyYYdroZfgsUt1BVEEzBoYru9JyQqDIbtAeo9T/q9gMJxGEaslAp
	ZbRnkhykQHYLE2oZLKnHccb6w85Bn/uEp0mw1camrcSEP9ZPUlanIpF5f5VPqRwA
	eKLX5aVfEfIBXN7eHHrz1Co+COp4v6zHjU2mLFVLTLoIF8SUgW/+/FHpN4Re+MIp
	GPeZ35fIXkmxDCjgkjLfQw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grgwfs5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49UAJPE6011789
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:52 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnadx94p-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kzscliQJjfz+GaLOPVHi9lv8zXXH5RgXMrP7We8FsWD4ceFdz+2QdJHovvYpZgiGn+UXcD30h7P7TJue/mM39ZTyZLdiQuvPcJAJ9u/OVwc0BZD05KyBUn86QKhNs3hjMc3k7j3djfdM9o17kWScPE71F1hyu2MKgALpVOhzXxWvGOnV7OrLTagVxKu6w83gJoidSwbLXTObKGgo/LTZgjiWbfCfs3SpfT8j8xWB9plT2kCYa4BMTmqrYGRG9uEBPqfLbbCbZyy1AAHHNwWODvN7INBLZP7yFzOZSxPPg/jOs7yblpblUDQMuVxM0eBqTeT+zHA76HsUk5e2KWVE1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WV24OHtq+RAtkZ8Mv8Ch/xUs6hbAz92KObIyIZuPIgE=;
 b=fPSnIiTeP1DkqMZDNEZW6pNR73CnsP4MDu5pDbq7Y2ICANhddQZJVdCaWH0Hru0Bkyx3bqXCsh5S9FuqvxWpiLtclOvDl8EI/oWDjoF7nrfNvkhn5jie0Z/1r+cXHgQKxYbowriPTFH5nXYGjfpJlSpEDdXpf+3AjOJ8mktxgjhc9+Fq1fOFtUySopjmx4hqmTmA1V0P0uXxCASkUA+EJozZjKwWswXbhQsB+ZpF4DHGYg8ADvyjtQhpxER1jM+jdJaNfGkc8wyv6YHhqcd+ZhNnhAcmwira3KVcbw8xh7Ws5BCZMmMl/KXdFSpqcTN2f060x7Guoc98Amt1HuJRQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WV24OHtq+RAtkZ8Mv8Ch/xUs6hbAz92KObIyIZuPIgE=;
 b=m9t+8ed6rSz+C9/pSxto81edtMgKBBpdME3wHztF+ewM3C4Uqd1Tv9e+v4SlyNhwiMTvHk/mh6dH6XXPiMgZRCyhWK56PtaUBtL5VQXvjn3nnozPgXhZ/Em8BNDaSBF1TT+AD5GJs7kIVewS5PxKv4B0XWVAOW53m2ycXt+QaxE=
Received: from DM6PR10MB4091.namprd10.prod.outlook.com (2603:10b6:5:155::28)
 by SJ2PR10MB7111.namprd10.prod.outlook.com (2603:10b6:a03:4c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Wed, 30 Oct
 2024 12:12:49 +0000
Received: from DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02]) by DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02%7]) with mapi id 15.20.8069.027; Wed, 30 Oct 2024
 12:12:49 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH REVIEWED v3 04/14] build: substitute LIBDIR in pkg-config files
Date: Wed, 30 Oct 2024 12:12:26 +0000
Message-ID: <20241030121236.257803-5-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241030121236.257803-1-nick.alcock@oracle.com>
References: <20241030121236.257803-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0326.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::19) To DM6PR10MB4091.namprd10.prod.outlook.com
 (2603:10b6:5:155::28)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4091:EE_|SJ2PR10MB7111:EE_
X-MS-Office365-Filtering-Correlation-Id: f240c9fc-4950-43e3-c217-08dcf8dc2bb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Mebx4L8+MdLXCX+d30AfAJus/jTzH+eC12RMu4r0Ksv1faDmbQH1pEpvqLvX?=
 =?us-ascii?Q?UdsiLDnzUOOUAj857zCSsAEhSBZA2yHmBiWJtpsBIrUzmq+HAqCoqvzy8lRn?=
 =?us-ascii?Q?CoYDb7nNycuz0tNee+TM7cnwzycGIDTy+OhRQW33xK3+ACXwmNIyipwmIOHE?=
 =?us-ascii?Q?x206sszrsFd3XHe9hIzdVimKs+Ys8iyG9ZX8u+gEybDXHB5IPf3iFIyXi7kn?=
 =?us-ascii?Q?so5UABDCGvVnuq8j+dj4fLpmwJzhqhyG6/LvEVG0ajyWr3tnQRMnzwTYRAcA?=
 =?us-ascii?Q?3zLFEB+feD+r6UvZtxMUCHswi7hkFTopUyxitA67seiy1v0cFhREFUoNJ3/w?=
 =?us-ascii?Q?OwKbc67etwAW6edrNUeT7kuXQV0C8I3WGHaWsuPPTnqKzcGUzJjg+EhnlH3g?=
 =?us-ascii?Q?tKPY41mRIro0H4IetZABTnbahh19uW68NpiSF4bFLL72Ngvh49HYombK47Mt?=
 =?us-ascii?Q?xqi2H1z9W1NYzJwdzGqPgQCE2nUmb88k0Dihvh7FSOEAJ8lDrgH5lBllbpxy?=
 =?us-ascii?Q?A6XloOhvuY+lXANZLGv2IzxIDmdYZwNbs7pfHzRc9qPnecysX32rXWING/qb?=
 =?us-ascii?Q?E7vxps8mcX8G84UafGAVOSFBBtkNcs95nlQjZwkjeDwU6gC1a7m3vjI/HMdU?=
 =?us-ascii?Q?OzJoHo/HRliTsneGbhGIg0ZPIi2oeupCOsVjYsFlfECw5Bs41XHblW4EWv22?=
 =?us-ascii?Q?N/LO2qBqfR2Q8KiMBw9oepC/BsFH886utuM3iMkpJiSoZirLCL4gH7MRzLbv?=
 =?us-ascii?Q?ikxUIeNjH5Nnn0m3vb+akuHfp3HXr/Cu+U7mxnlWMhmNa5X0vvcHT1s6ISeG?=
 =?us-ascii?Q?c3RvRj7xp2SyBA6EIFd0EaPqEQLqr7Rg4MfATgBPhiyF5h1gsqLgxP4HdIGQ?=
 =?us-ascii?Q?2Y7xIEyY9+QveanR2bCDEPW8/lc5OVQUoFeYLPQyp3INZbqKpUFGlsYqIY0M?=
 =?us-ascii?Q?LiDVVnP8unO/sMw8Z8KVDFf+zXxgS49SOFBoqYmbjKecoLsvTTpKqzv/zHu2?=
 =?us-ascii?Q?BFUeerah2AvDFKBENoUawYjhbghOGENXzeY0+ovi6ECvQh7XV1BiheZuLME4?=
 =?us-ascii?Q?quso8soEiTGAEtsR6KCVKmhmgDD+gRH4rqkXzxlxaRkCYNis7oTobwOUxU2+?=
 =?us-ascii?Q?f8EfKHR/jmgMjtNoTrgKN/elap7MbCKbFRsW60XlQXnJwYCeqvj/RtdxmgJk?=
 =?us-ascii?Q?o2gJ2hOxal4dXMcOgMyMu5Q/9NMCmSToa0oQO7sLIGAjOgKsoLxaqAR4Zjeo?=
 =?us-ascii?Q?gaZOVIT/qn2CaPEI638H?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4091.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7/avd7jxw9AZkQlWbyHe09gu0AXc+CO0U2ZY34ZukHzPXbr7n8At/x68j4Yn?=
 =?us-ascii?Q?Hon9J7thYsqTBRwDLUQJ91+g+2YZjAEspK11wfSojSfPF8Dl8QX+XUBaeg5C?=
 =?us-ascii?Q?VsaAObbJAGSztLbeCnt/4sEjoEA/w2WmgADQZP/S1s3Jmv/mlnVuyPRllxdM?=
 =?us-ascii?Q?LKSWHw29Vyy/D3stG9mT01NWszTXDi0pIgx8gv0TbA4dLfalFczUwt68y9sd?=
 =?us-ascii?Q?nGGQKqGUvvnLwQJEobI0VKnHHmF3wsNoxZhJy9VWkQUXRcwAYZ8kXi7dQEmh?=
 =?us-ascii?Q?5SzuHF+I2/4/HBCcu1K6KBJjtRWl+Idvzi90EVyya5/t7YPLQfY1MM/oEBgS?=
 =?us-ascii?Q?tCshkJTypSfXisOlHpSohRrhXyTYMtQ3l+bRlE9Bfzh+giOQK9529bJDFD0W?=
 =?us-ascii?Q?VahZXx3jAXUbgGF+6rrs5Smq3QgbSuR1LKPgK8zJ4Zts5nOzIxxha+qpSL7/?=
 =?us-ascii?Q?MaTHe/D2R0UkqGaVPAqbuovSnKMUqNLpvXpC8TqBaCjuuFzKuTGQkmfOWy8q?=
 =?us-ascii?Q?lQaWiTv7+kMRT2cq+U8SZ2dgscTd1CNXM3qjJ3XLdkWZ0kTStNCx0tTaWOyw?=
 =?us-ascii?Q?f2mbdVWA9adVRU0n42wVs+C5LHWIxl7+pvV412ACUWEEUcNktRWNHWQlkNex?=
 =?us-ascii?Q?6El5qCSnIC0rOGpMTcGzoMAOn+MgufNrWBefVT0ePYjahDjdzco7n/QVVNC0?=
 =?us-ascii?Q?kgtmXUNkoVPzi6wfaB6YZNry7uwGoezgzHXwvDGkYbjj35MUAr9xEgZxVH2n?=
 =?us-ascii?Q?oMNGdomn/d7yxPJm++OHqU3Na0671cePaxF0zmxMFqx7MZuJ9prUjCKkS/85?=
 =?us-ascii?Q?Ll5O6x676bvDBv1Eu0Aw+Fy7OBQznjEVmlMon63htZjP0TwJAY3qp3SNzm1m?=
 =?us-ascii?Q?tMdeLeqso9WS/L+jyfowh8JxpCX5B+rwxa5C9yfTwYd1h8CkbWRZ3IvqF2qq?=
 =?us-ascii?Q?QCDUcjQOSb9PkhsA2sn/YlVF+2fZWcU8YbFWXxcd+2Zc8ioksl1OzLOp4nrG?=
 =?us-ascii?Q?uzmf707QQ4PhOizMA/sLifyZ6ZqKm+MVe2pTSKFpY0d3Es3wwi3klx77FQCC?=
 =?us-ascii?Q?W3YTMzyMmdiuV5b9PWEsPD+U2UXr3ExT+on6LG6Xhx0gTR1xl7FXs+NprQWv?=
 =?us-ascii?Q?ZkFhh6d1F69vtwxV8dzROSK3d29LK2PZAVeq2bMjXBDVm9uERuYB6jJ3Q095?=
 =?us-ascii?Q?NNy3WWZjhfaHmgxCnixFs9e0NIdOfvfadzqj+OFOeqVh7FaeVWKrklb8Isao?=
 =?us-ascii?Q?gEql1t2V8m6hsC0GIrXC92W+6BgGS2yotm1MNUKo2hQjbCaw1iOvaN404Tny?=
 =?us-ascii?Q?T084NK1eJe5nABZZais2vRKA1MkBJm3PXjfc9YWmtET4NyUDrfzgvy52cshf?=
 =?us-ascii?Q?Iun20Y7lUaH2scGYhdqSdg/h+AP0sFpUMaAw8uMeRVWa25YC6hu0syKugqDf?=
 =?us-ascii?Q?UrE3Vn8jPyZAn/Via33U06WwfLCg0GkeoCZqSXawjNBEbOcKDhR/kaGeQjpP?=
 =?us-ascii?Q?Nzcntr0VmprLQ0++rgb3IE8C9Svsd2h0mzHBPu1ayqyGCDkijZXsE97ldTHs?=
 =?us-ascii?Q?uYi1lkvJcobJ15WKhFYgVDDu8hSCFYmx1texf/d6zKl75t458S4Mp9MmFrkm?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cHz84OURCeQr+MY0OTyY2P7HvxDdIrKQomHL+q3bbKlx3+gCP5j23c/d8WSBhGL7FwQR+AhVzqVm53Xgu8k/V0Eyu0BUpw0Zz4DM6tfcqlYATxORDcYoCG6O9ZzKpsrgbpEhhIm9MwvQsXiP9pVEMY/VHAUSDM6rqaHjigCwKNsBsz7xHvYRFLyfEAfQ1eH8LPULWuwtGkvaNKHNz8ZCFP8uU/XjpaPHwN9kyBbtxuypoNV24CTH4w5ASsd2XShoc3axQfcTUvVU+anztKmhKWzoURB7RiLQlRw7QejRV64hKsY3J+FsxUFGUSki/UGhu/mm+VQ+gYWChNCyDrW2boZMpW/h9MGc0mq+FOIiaUs/e0YhrGmng/Q/VadqQJc+it6/ctPONfp4CE+LYBCP0h91XEz/6XazIE4eunMmNBrrfwsr1ouIViSkrWRYCdOpN9q8B1wjLHc7Zwr2bUIVJsqJpsleD0EFFPMbvHtudabM9Wgsio3ynmOkTUvJ1aL6hzofAWTs1v9wj5NUvBDWjx73JrEI561CZHxFYLBVu7i/5GcUaPG9QBiyIJG0JCmbRtKzhAcBzXPBbUTaNXpVUKhNNaYkZ7nQH8B6pRVgsag=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f240c9fc-4950-43e3-c217-08dcf8dc2bb6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4091.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 12:12:49.0644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cmiSyZy1Q8sF3joLDSEpYDfzsXy0D+X4kfYVcejj/6canWyhuQFvq2hUw7h2SPMXc1h/BK8C7go7VVh8oaFdHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7111
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_10,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410300095
X-Proofpoint-ORIG-GUID: M5Z00nwq2PSStScwuZMP3MOEUEEKjkLY
X-Proofpoint-GUID: M5Z00nwq2PSStScwuZMP3MOEUEEKjkLY

/usr/share/pkgconfig/dtrace.pc says

libdir = @LIBDIR@
/* ... */
Libs: -L${libdir} -ldtrace

which is unlikely to work.

Fix by substituting LIBDIR properly.

(I looked at these pkg-config files after installation I don't know how many
times and never once spotted this incredibly obvious problem.)

Bug: https://github.com/oracle/dtrace-utils/issues/104
Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 uts/Build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/uts/Build b/uts/Build
index 181819410624..65ddc39845c1 100644
--- a/uts/Build
+++ b/uts/Build
@@ -37,6 +37,7 @@ install::
 		(cd $(uts_DIR) && \
 		    sed -e 's,@SDTINCLUDEDIR@,$(SDTINCLUDEDIR),g;' \
 			-e 's,@INCLUDEDIR@,$(INCLUDEDIR),g;' \
+			-e 's,@LIBDIR@,$(LIBDIR),g;' \
 			-e 's,@VERSION@,$(VERSION),g;' \
 			-e 's,@DTRACE@,$(SBINDIR)/dtrace,g' < \
 			$${name}.in > $(INSTPKGCONFIGDIR)/$$name;) \
-- 
2.46.0.278.g36e3a12567

