Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484EC183CC5
	for <dtrace@lists.linux.dev>; Thu,  1 Aug 2024 13:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722518536; cv=fail; b=MjyywYLCGZeZ9FcLPzvtFg9fATDmFCATQ1KiZu/XQWUqt5Vm61Soqb7f6Eorx7FkcMfU01Mcq/1ZWHZG9mQSy86SUYM+8CVDyqVSAzppsVmwVtuuWxHl2Kh/9tlYOKKxblwj0MQC/fVR+n1pmUUpxeqXWoFlwv6EiwDbJU5HscY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722518536; c=relaxed/simple;
	bh=0WtxxR6I2io7WckNnaiokSmF7rdlv99Yl0Zqa2xqTMM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YSffoRGnbs3ZtKN/3DnkiEPuloQAQwUx7dOHYIs2G4Kp1z8jc0RCt8olDO84T33ijua3P36Nh330eB54zkH0w/UJGV/5Tpuodg3XOZJpRZaACmfFkHIEpFqGIxEtv4k6ah5VOVM9QABTZfArhuku+nqnaP3Cao4TSXtjpywmGv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ho1e+2aI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iJ5S/xO6; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ho1e+2aI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iJ5S/xO6"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4717trIH024816
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 13:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=corp-2023-11-20; bh=2rWH86WYAzCs8x
	pNRnS3w0WvjVyy93eTuXszCpTIzFM=; b=ho1e+2aIOhTZRuwgYO6oyBUP06DfwZ
	oN0VWQZeaZlTebLxdHQ48hOIM3/rTyIu7Rwujgbjs6WSl6U3mUia18f6ANboyr2O
	6rsRGb86Jg8dsAhu1YZQtDrLVi7T0SWFc7oxUHVMv12GKBI739nXrks58F8LQxdF
	Gc61HBwH3IFx9RzyhV7k/RsTkFDDr+jTdcSu9jAm+pP+gMRPey86jtmOXh5kOJ4+
	/y1+VVyI2/3m5lzLZ0LDskYCDnHGNpuiEKNNY8mPMbh0EKugvx+i6w/zcYj+dHqf
	LzJDptr+Oi9TEZv4r1XLb0q1QD2q1w5C/zH9MTDsplPeIbaYcvEkPV/Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mqacsr2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 13:22:12 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 471D3dt3019097
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 13:22:12 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40qjmtmr11-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 13:22:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RtUCl12sKKnUdWAZHAa6c9Zw7IxUjoyv5v7U5q7K94Ds1K9oOfzcWlishUOONOn/mSFu+n94xn7EgJdaeF3/UOTsmwfLTXdBsPvGOAY8YNbpCP9yPQhS8E0XE63bBG1T8sYX/NM0PaOX4IYrbWAlZdmLgEjbyhBOmIB5YuS5S6l4n09UodgnjYz+c8iNhcAytRz29mTTN+sb1v82daQd9n4hNzK8AUcg6BUIAcEicp6G+1PyQXFaFpYI4DmZW+3RG3CwGWHGqN55agbHMPG2sMyXDbguVwosFqJQCI952diLUl4PnqjFr4KepKVyHaK1Cm8KK7B8lxVxne+DrobuNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2rWH86WYAzCs8xpNRnS3w0WvjVyy93eTuXszCpTIzFM=;
 b=aix/DxEFHQjfTEhkZjT95wfvQ69JXK89/VdxAhlK45b/jGNMcuZiOCjbZj7UtS2RFPANB4u8VlfyVufN+nQ7ngv7SI8w7d992G3IMK/LK5oo1h3Ff2tmdHWP5Km90RQ1rSLXndu4lfvdiQiOCdREkXONOVKAMUn5JYPpVbyYr7bmvk3Y5zCom7hT8iQH5FjAMZDq28AR+bMUU2umgvZhUCpMtfAP/fQo7lM1EYOKW2Vwr7VH/S8kalzBQGG72JEQUIwnwK2ZymB7UBq9raydNlqTJ4+axCuGQdYx/xo+gKT7MjDT5xy7Vy4v3tmbb0z/sj5YGThUAq106eHEwnJHvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2rWH86WYAzCs8xpNRnS3w0WvjVyy93eTuXszCpTIzFM=;
 b=iJ5S/xO6zQViTQzGQGFm6oqUPZ7FAypgUZaD8bjzcBzW3ytPPf14f+zBLdlsPWWeaedWbBnyilqdwuaxMDmQ+/PqwF+AKZOF3Civ7eCkBG/SGPF6PV69lN2/pbSqy8bDBpM0RLcZIPjXwUN2RGGQLfxkNmiTKMJSrUxxb1jOcwI=
Received: from SN7PR10MB6595.namprd10.prod.outlook.com (2603:10b6:806:2ab::18)
 by BLAPR10MB4881.namprd10.prod.outlook.com (2603:10b6:208:327::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 13:22:08 +0000
Received: from SN7PR10MB6595.namprd10.prod.outlook.com
 ([fe80::4384:e7a8:8394:dfbf]) by SN7PR10MB6595.namprd10.prod.outlook.com
 ([fe80::4384:e7a8:8394:dfbf%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 13:22:08 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: kris.van.hees@oracle.com
Subject: [PATCH v2 0/9] relocatable DTrace
Date: Thu,  1 Aug 2024 14:21:47 +0100
Message-ID: <20240801132156.286780-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.277.ge12b8151ed
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0550.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::20) To SN7PR10MB6595.namprd10.prod.outlook.com
 (2603:10b6:806:2ab::18)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6595:EE_|BLAPR10MB4881:EE_
X-MS-Office365-Filtering-Correlation-Id: 9608e9fe-dade-4111-af49-08dcb22cf1d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?09xPcfk0Scbtn3wN8PDhVvjjvVrhLZGICfdw4y2vuOvxIRVHD5724gyIvRPE?=
 =?us-ascii?Q?POfb73KGVud5IlXkFwolPG4rdikGKtVG70UaA/a7Npu0KYJtRCy5uizL8+SA?=
 =?us-ascii?Q?Ph6hy3hFiRtdMck1kdLUu2xM8AjRnubsLfxcmPo0/gkEZfJXhCrRbD1pjr2x?=
 =?us-ascii?Q?VhaODRZ2AgG0095A4jWavz/LOWi5sZmLg03S0TCzwJ3MlM9fhodMuoWzPgr8?=
 =?us-ascii?Q?/ZlbIbFRvh5Gzeocbt2KCnqqbYTM8iIF5f4SBv1RLqyg7vNLWkFRsXXc0lXe?=
 =?us-ascii?Q?/AsR6YtoOxwIAHDuzyWfkW+WH9ReAWy3uJKdaZdRzWr3CBS+gGG3zisRdDXP?=
 =?us-ascii?Q?fTK/Ut1e9kNu0GvZ0VaqEVadstN9Jat6ma/37/+XyWpQ8imrxnjk8DdcY0ZP?=
 =?us-ascii?Q?wagG0VwZqUakT61pL9hfBlktSE1w6TLab0vfZjgaVdYh9pQw6JlnQdSz/tQ2?=
 =?us-ascii?Q?JWR8gm4jqKvk4xMquk5prczmZTB7DWsoXLoyfLJ+1VYTahLhJx/+F43pbQ1I?=
 =?us-ascii?Q?hbAQqiTYup/Dfu6+baaRlB1SyGMBf/U5zc2lY3tW3Aw1ZU6ewW8zo7fio4T6?=
 =?us-ascii?Q?VzROPCW8ICuNSWjd2iGPAfio/dzGwWTBCIhNmP0XdNKUO1Bap3Ckug0TeH2F?=
 =?us-ascii?Q?8v4gX8p3ZKk16LHALd1m9aV9fT7Yuo/AaRQ0/gVfJ81EyBJogL/yD2+CrAl+?=
 =?us-ascii?Q?QqtQP2ybDPzGk+dghtt6OelgmFtJrdWAFpoHzTDPD5yipq1ImK97+1ryIBR+?=
 =?us-ascii?Q?O7ht1epU8WnbRZZ7i1Gtj87XiyKOeZ0zyaYrc1arC1/6rWXm76CBKBTs+6ZN?=
 =?us-ascii?Q?p5HgQJwjwFOaJ+jb0N9o1twCfFAxV1QEtD9Y8CNNCGmoeVM9z7Cz6pH4ncZ/?=
 =?us-ascii?Q?idjxNsuXQOyBsTkqruaH5c0gpr8Y3sDOwdSgCg3BLo6qdcjni4ZG3/HwmMrT?=
 =?us-ascii?Q?pQ+YFE9ltoN9BRsZXKCHf7tsz5q9NXF2gHvOhSlJDo23uhbv7bMwjFmhGrEh?=
 =?us-ascii?Q?+adA9h1S52/jJ1PlAVz9rK2RiEyWYdeU3g0vLKzmCk7oB48HhKgJ4vRELBua?=
 =?us-ascii?Q?ZLBMDSJsGfhGN3MFqovK/B2w6LL6B0EDftu0snO6fsOIjd+2MnPvZvhTh3g8?=
 =?us-ascii?Q?XN584CEkRuMEI7gr9akmhgUHKwrfrta/k1xhmYsE2+NZlu6yHNs6Qv6UdGjl?=
 =?us-ascii?Q?SgCZ1/1ikld0EPRLkAWKWAqnfVh5zrSL+ZyhcsplHCvTZsE8U2CdxaiETEMm?=
 =?us-ascii?Q?05fQfgT9pySerRn6Vxe6yQwiPBVZkgJG43gN8+eZPD9tpc/suQOnQQUVh2g6?=
 =?us-ascii?Q?jHdh8OV9VqUmmmR3qgoe81V5rmVGZVTiH9P4dx2xJYiV4w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6595.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gxS7Gixz6S3Qnc3Fh8HFeRUmwGJiMMyO6CbaHQ5KAy3Q05b//w2JHw/R/Don?=
 =?us-ascii?Q?LTMbxhEVKgbA06I9/rqh1i8VdBS5ZdO6CcL02szzQBiI08NlH+2qKmPex9Ri?=
 =?us-ascii?Q?3g0VoL9VMngWeceiED//LsFE4SzgRExQJ6lw+mmoWJUq0Ti86Tc3u3CK/LI6?=
 =?us-ascii?Q?//8/QLukAJUxI63QJ9hqDSs+NDHljSLA+eWIZWVpI00B5LGgQm3f92+8/y/c?=
 =?us-ascii?Q?/i115rGMPQCY7JoJa6Fo/VCvRk4Sx+sn4Sb9HY/F6fMMqJCzg7JZkEC/Tdzb?=
 =?us-ascii?Q?nDHQ35JaApA1c3cObLFtXJ5F75cZNWL8z2D14LJnpvcqMsZpPt6+fSJN8c+j?=
 =?us-ascii?Q?CjJfx67jrkZDmoC+EPUNFh2xP3Ewu/kXkyV+UU6AteMBPU4rK6o3sfs73//Z?=
 =?us-ascii?Q?BfxH5iCQblzcCfg/lNhr1fB+ZdG7M7YrNkz5Y4vOyPQM8XZg9IxyUrqOUevx?=
 =?us-ascii?Q?N+P9NVF5btQZ0roMu9nTLRIV+XeDy+D4+tMgmZaepiScOMzdsKDHV9Sxhjg5?=
 =?us-ascii?Q?tEGjwDTTx2Dko37WAo8FbkWvzxSRbxuSk17zFq4MV9m6ORE3QukW7y8NI0iC?=
 =?us-ascii?Q?5DLGA5J4q3GPKVazcQGBxtZqHheEwTbBsL3eyzVPgYryOIcE9VBjhLaH43Cp?=
 =?us-ascii?Q?MFripbWVnoJ7S9ZVy/iteD5LVqupGTYYDSMp/0i4VVXOv+gMq15eEgWNKxOi?=
 =?us-ascii?Q?JlaJL4eBsM1XKnrEgRN/i0Qze5mF+sfewCeTYfbohH6Bd/c8rjGfMMJPRxxV?=
 =?us-ascii?Q?x5gyyhkLtwc4eF0iO+4Gc9xJyCyvKHq3h0EXdFHo5G48q315QrxZV+1p6+q7?=
 =?us-ascii?Q?/scF5enxPvqrX8ik6zWJ1fH49+0zSJzSCV5m9qXu6pKKLtMGUG1Yh2/8JWCF?=
 =?us-ascii?Q?7YATIOqYxygJoK8IrsVsQLXlo/XJK7fbWLUzssF4aoyNt6AhT+Vc6IgLoB91?=
 =?us-ascii?Q?qxHoUawhGrt1NnHJhi/jkvSn/5yqfp8bBNtob969EWSodvWJ+QrweblnHRzQ?=
 =?us-ascii?Q?wycxljLvE+CLjO/jdSNRNy1yP8isUwKslJSDsTNjrKlx++3tfzRclt2eNj1D?=
 =?us-ascii?Q?4Jt99nYU75kxg0SLa+KZEbUmGyzpqpfD3LqjBUQfMz2CF/mZwYF3gUxeXy0m?=
 =?us-ascii?Q?FFv3UpuXOYJVqwpZm7Sbl/ekNiDeTSThEfnj0RXTC5UaWlXkFZzh3/LI6Gn6?=
 =?us-ascii?Q?7BFhyeYEjCwS2Mjqrq8EIQZG3Wq6zmk36BDnSH5bJR++qaEY8BQgC8Jp1ggd?=
 =?us-ascii?Q?4g4uh8eDPxt7tfvM4LclcN1vjTuM43ighai6+rUbqtzuKn+EVM7n1UCgwpVh?=
 =?us-ascii?Q?p9XqJjf5UwIQIPqZi5fujFgkiz7SQkItwg91z8vq44CganRchldKeWJUTz6N?=
 =?us-ascii?Q?q2WHCuNSbCf/BnhkaygyavbxgIMBluOhsVJ2hDsGMilbHFZWGZFiFCYIWCp1?=
 =?us-ascii?Q?4ZHhhWZVtC9maI53V2m04M91mtTEN66mZZ5Vntbm3VyBHUBBjXqY4QJ1dPDX?=
 =?us-ascii?Q?Esdgwj3HKzhl2A5PcUhTXPtUVdfMDhsRc8uWYuDxYFYgyRR9cbMg8zCePNgJ?=
 =?us-ascii?Q?yc8O8z0svSSUCDTM+9OKHtTZJYJ4KNJivkREN3rhyqHbbQLrb8Hd91p/hFWf?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	N7ZvPAyJvT68iWA41dw+BfDCjBzcPZfaRVYQRTSxNc6ZQnnHgZOYs5BJ4xL56evTJXOoP1LbVEAhNCNVemVEDmCXLEeWh0tiVeKEW9ubL1EsYjqW60JlkYELbXDqEgFCl2vLiFhaf5UPboQ0i+/5q0TEzysdXe2O6q34U2BuHh2hMdTTHeczpl3f6/7BYwj3hlGaObvwahLHo/3MgTBH3pGocirdLeXhJnRT3/NXHrsK8NhtUoQWK0rAhxE4Fd3/VX8aZhx5fceBivndVwF0sym+YPoj8iVQ/EoNaA8Bg/k9gzcJE8K09wdkpthJe9MLzWG3lNa5FfejdI2xjruO9OO07EjPDpJ15n98tu4UhRF1QepNlOofnOFmKaysU0ewMutULx3vFfuA+kVlSGNm/NYDMnwh5+ZLxqj1aEzjE8Ny34bp8MwvRDvjJnIP1Z5q7oJyvdsihuFS1e5r045TlNKzx+b1/JCBSocXZEUcVCye3U3oGjFP8y48D+OOThZpKwDupp4BWLKlxWU+WTAYJbviO4Sanzay5YWf6L+nG3XrvY7g/vo/IF8nVAfslU4oO/l3Gjm4gsx6L7HYU3zashChOF3UoTKevqfWyltJWS0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9608e9fe-dade-4111-af49-08dcb22cf1d5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6595.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 13:22:08.7477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lVWZ9ibIWDvN2JpRuItT1IPKSzNZ+2i0rFbaoqg/EGr0njQP49cmIVkBSYc5fin0yb9CiA0ntCAV9hKwHoZ7iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4881
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_10,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408010086
X-Proofpoint-ORIG-GUID: sHoFq_f4uyhMex4-uRazurgV4ZkSTy9_
X-Proofpoint-GUID: sHoFq_f4uyhMex4-uRazurgV4ZkSTy9_

This relatively simple patch series makes DTrace work with non-default
(s)bindir, libdir, includedir (changing the other installation-directory
variables largely worked already).

We add a pkg-config file named dtrace.pc for the consumer headers
<dtrace.h> and <sys/dtrace.h> and for libdtrace.so: I expect there are
no users of these outside DTrace proper at all right now, but providing
this means we can point future users at a suitable pkg-config file so
they can automatically adapt to dtraces installed wherever you please.

There is one wrinkle, which is that the udev and (especially) systemd
service files for dtprobed have to be installed somewhere where udev and
systemd can see them.  We emit a warning if they don't end up in either
of the two fixed locations where systemd looks for such things, unless
the user has explicitly passed in --with-systemd-unit-dir=, in which
case we presume that the user is doing that because they know that their
systemd is looking somewhere else too and is pointing the DTrace build
system at it.

(We add an extra makefile target to allow users to forcibly install the
systemd service file even if we have not installed it by default because
we think that it won't be used. Users/distributors installing DTrace in
--prefix=/usr or --prefix=/usr/local will never need to worry about any
of this: in these cases we install the service file as before because we
know that systemd will find it).

(The first of these patches has already been submitted on its own,
but this series relies on it so I thought it might be clearest to
resubmit it as part of this series too.)

(Multiple test runs with non-default values of prefix, sbindir, libdir,
includedir, and systemd-unit-dir passed OK with no failures I can
attribute to relocating things.)

Changes since v1:
  As requested by reviews: in particular, runtest.conf is gone,
  and we rely on pkg-config to find the dtrace binary when the
  installed testsuite is run.

Nick Alcock (9):
  spec: install sdt*.h in /usr/lib64/dtrace/include/sys
  build: initial pkg-config support
  build: track configured vars
  build: --bindir is supposed to be equivalent to --sbindir
  build: the TESTDIR is relative to the LIBDIR by default
  build: add a pkg-config file for dtrace consumers: use it
  runtest: remove obsolete kernel coverage data collection
  build: make dtrace and dtprobed relocatable
  test: work when relocated

 GNUmakefile                                   |  6 +--
 Maketargets                                   |  3 ++
 cmd/Build                                     |  4 +-
 configure                                     | 11 ++---
 dtprobed/Build                                | 36 ++++++++++++----
 .../{dtprobed.service => dtprobed.service.in} |  2 +-
 dtrace.spec                                   | 23 ++++------
 runtest.conf.example                          | 10 -----
 runtest.sh                                    | 43 ++++++-------------
 test/unittest/usdt/tst.manyprocs.sh           |  2 +-
 test/unittest/usdt/tst.multitrace.sh          |  2 +-
 uts/Build                                     | 17 +++++++-
 uts/dtrace.pc.in                              |  9 ++++
 uts/dtrace_sdt.pc.in                          |  7 +++
 14 files changed, 97 insertions(+), 78 deletions(-)
 rename dtprobed/{dtprobed.service => dtprobed.service.in} (95%)
 delete mode 100644 runtest.conf.example
 create mode 100644 uts/dtrace.pc.in
 create mode 100644 uts/dtrace_sdt.pc.in

-- 
2.46.0.277.ge12b8151ed

