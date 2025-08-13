Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36D527A446
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 15:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755100660; cv=fail; b=H5M1WS5P5Wj3R7qXwpv1VYGp5XzLunv7Z91/Ae0jTUhIBHC0L29/jG4HBefX2V11RylinTjDWqmtTtx+qrlOha6sLykh4CMr414lQTYkg+If/Ujotstoq5AW58z/HP4svaSO3NgXw69KcbPb4Mzr8LSoLkyIGeAnwGE2xQo4rmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755100660; c=relaxed/simple;
	bh=0n1nnk1LZeDnNd5L2FBNFvdfrPeBwG6JpfYLjKZO0Kg=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=H8H4pMO5fS4Cs55S/P1ZzjYsnLyEVC1Ii05+JLBFWbvulBOiEfq2y51V3mKZJOAQ6VFz9hyi8LgyrWanrnFT5CfHYCr6hnBfspjzfGXvjpGLxzUuG3T3BWHLKv7nsud88uYMsNBq1ULvMksbjKptQA/je/R78YaDIKQaUF5F0DM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eOphQHE4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hnchXHeP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eOphQHE4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hnchXHeP"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DDN9PO027088
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 15:57:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=6WQ5TcEkuGVuFqpHqcAqjPr/bUtBJC9QUpG0U6fxxhU=; b=
	eOphQHE4qdo9D+n1nV6ACBma3bzARgG5KyvPk1ZqTQfSWL1QcwO9b6MT2G2q7qyK
	Tdwomajo6ZTHLHh5SujA9KxqXBn3aqwMmQlQHOp7uCTrBqVW6dT9RJrKzSuMfcTm
	EhsbNxvSm183r9O7cvitiZ9sB7t0Gb0KTjKSIuOBA7FQ17kIMJPBBSpeNmiivimr
	SpALIj98xEfXTU1qkzXT8hXjGZZ52mlikZmQN5kHwEZ1Ta9PPJuOk5pF0uHzOqHZ
	Jl5KM4H4KsJ/kHyXDvhxPLgTrxgPZ4WfjCVS/qKpUlNGwpNIOLdCel/Yp2W97/k5
	GFlfOPnNzJFTKS4uJtGDsg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dxcf806m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 15:57:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57DFep2W029979
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 15:57:36 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2040.outbound.protection.outlook.com [40.107.100.40])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsbkcyd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 15:57:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ks2uxYigjRG5M+NSmMVWNMADMfcbsXJBVKgu0qLroYWPkdaK58zDQwCnPJ8AtbeFhjMgnixI4LdGIAV2iR9JbS9nR9olqfPBulIzsANBBEd5pVLRDRz2zNqf6FxOSRFp2w3Me7ewtHTjzOLxgfoFYnT7c/N/fOjebxeHsjs8KqJpO93qRMrtBtBv2T/0QxOl+lH+u6bn2sV7Bn990yrEq2eRdmVncqjYagnJ+zAspU9BHfL617xO2RqO/5Hy58Xfnf85a6giCMLYeVq3g27ZjpdEeCAC1U8892rcikRLhjhRnoUw5GRpEKo9/2IHctC45weqVyOiXVrHcKD/QXkgbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WQ5TcEkuGVuFqpHqcAqjPr/bUtBJC9QUpG0U6fxxhU=;
 b=ZkkYJhMMBPf9E+JSveKbiQJLYjiYaNqwTKHgMnrD8bFj0BtjVvawOHPCF8tOFos7ytkhcCMnEc0MmnRirpG0W2l9sRqU/gxLv0S4fJKiYLc5vlSkDzfzULE2ADWwOyt/5a1MPB3/3WjR3O3YirCuzXhrdKqturPvvY15eUtkoT7vEtxsdfeqcwmdpWxmZIKLJScRR+8UI2qLpvTCKql1ddsDXUI3LXFPf/GPULlzN/0yate0CcMpIOr3HQnpgftdxPUevB2tPccPG7DArVmv2GCsBSPMNaed8pVupsIpsKav1wW3YNIIZ3mti3Wd0OymdTYmG26GUx3cYzPIwQkVfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WQ5TcEkuGVuFqpHqcAqjPr/bUtBJC9QUpG0U6fxxhU=;
 b=hnchXHePscyD6uLVRAcSKzpqxOxu6cRDyekYtHYqQHPmSg76x+AIG5hqFWmQaHGBmH+T1bKEdloYc6mZM4dXItxwNRTr6X+MjJtgAPqzt9kVG/CuKHYE+dBX6PpQDhVCEAnpYVb4qJ8kmzTcfj0/LNE1B076KuVYh3+oYjHV9VA=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS0PR10MB6222.namprd10.prod.outlook.com (2603:10b6:8:c0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Wed, 13 Aug
 2025 15:57:33 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Wed, 13 Aug 2025
 15:57:33 +0000
Date: Wed, 13 Aug 2025 11:57:31 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 4/5] trace: handle the empty string in a sensible way
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:208:36e::8) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672B6FE7FAA35DFE6F946D4C22AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS0PR10MB6222:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e326c9c-a382-4f72-1470-08ddda821dae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gtAGTeJ2T3dSqqRc3iL24UKF6kI339msdYM7vG6xjxyLe5gi7OBcb5N+gNBU?=
 =?us-ascii?Q?womwlg0G1X6dxyR8e3Db2U1xFsIoiM7au/eVYCsQNYS7qbrIEzof3gp6j17x?=
 =?us-ascii?Q?vKUIj+h/qW6xFRXN+O1S+S9JzLA2XPOo/cakrjVcYze8nlO45oU/X4cGVsEe?=
 =?us-ascii?Q?bbUFpUwTUyGaBsXX+XJaGF3pkh756yH1qkYOaa7LmmIFEUFoSgCH2PFhX6Ze?=
 =?us-ascii?Q?dPJ92SKfbcwUQktlYgAQLAeAC8WsNzPJXnxF6dJY0tgxtPufCC8Zh7n6SebY?=
 =?us-ascii?Q?N5V8Ml12jq+sqWd8xy1lBHX4JVOLtp55QM8jlpAmoCEq1LePbKaoFRYBzp95?=
 =?us-ascii?Q?5ecKKG78wDPdsHrCmDI6rq/e6+ssu0tObLvoD2av9EwXHmjis06pZwwP66Rj?=
 =?us-ascii?Q?AYSyLoNAYxfEWC8Zu4NCVq0sInHRGydyevmhd1vSYxPzRbmTH0KaJAgVRqmo?=
 =?us-ascii?Q?t1c5ndu/MzSSfBd4BFnDe2j4NBnvEj+KRggceAxG7gh7dgOQMPxFNAmJBdAt?=
 =?us-ascii?Q?h44q7pIkvNUDtlR2ZeDfSEC7Dr2181BwBJTdCksOP4b44q/XJ9K7ocGJ8SrR?=
 =?us-ascii?Q?2e8cJYr/+zTKSVmv8ubRK3mLXxQnW5KlPduDzCSlcAQw48+XthVXcR60yjpZ?=
 =?us-ascii?Q?LcgT8G/Pyj18LnoJYRoKo+aCC9C5vnenoh0emrw3oXoVWER5r/92ez3+lhZj?=
 =?us-ascii?Q?yZxnP1g2ELTixi7YL1BV7LUHgLWGEDabIohBpgDUELqE2L9FOk3DnfaCDBcp?=
 =?us-ascii?Q?vzTUKKGOGHuPK64cMI9njLzpJUMe19omhSbbPWSQ4xDRniddTn3UUTmRU0Wu?=
 =?us-ascii?Q?i7+DRliJ0P+gQBiMknqV3Y6qm7IwXMUhO+mHWvmEilrYZZzadPy8VH6k8I3p?=
 =?us-ascii?Q?3a9+oO1XQhFOqCjrQDTS4qWTh3WdInF4Xz0zDt7E2QnzjM7D4e0nPtMAYhJT?=
 =?us-ascii?Q?pV9OH6aw28Ott/49dgqVBYH8rcZRGRUmhY3Pxa86RvYbGIu7fAvKhkRldQDP?=
 =?us-ascii?Q?XdtnfVMRq8cbxiAv1ZbOYLRxVgz9oqUZv0OOJBZhvoy5J7+w6PH8dKojaIZs?=
 =?us-ascii?Q?nASVDM8roKzO8W5el4IkdA7roDpY7Pypa5SMm8n4JJJTsmBApzJjf7wyixTG?=
 =?us-ascii?Q?OsCwb1fYML/O/2okHLTS4fjh4WrffU0U8SlhJlwJyiAN9FQS4/2jeex2ifK1?=
 =?us-ascii?Q?kkAoRq8vJhTGFaivbE7Z31ZwT5OnxIyV9gITxdyqz1IdQeB77oumvDVo/S3M?=
 =?us-ascii?Q?JHcqDRG0F4O0p05l8i2rq014KdJyR9ptGtt4TF2+wYfR4wMJN32V4QKfzMkU?=
 =?us-ascii?Q?d3f12kfMJpAjCH69jFvWxls1WbzL6ICqi0L/aOjPeiM5YM0rCwQaRQTxv/xj?=
 =?us-ascii?Q?vc8G2etJ+awdCg1N66xY9mB/kEQrD1MBn8AiBUY3oAqyGn+eZM1GjgPhdO1V?=
 =?us-ascii?Q?eaqKquZUlBU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4vUemrfxGR1rBh8/L2KLL8+18fYF8vatLk/s9bbDXq2XeA19cwqvYDsezy39?=
 =?us-ascii?Q?ltcenJhYQOSmzB12ViaSmDmCCMynQgNXIBQnyQ2lvpRIyfdbGWMpEThJ5OKv?=
 =?us-ascii?Q?HZz9MLnGauM0zLV+cf81jwuQSBo43jPendt4tucMO94vQX6j320UyaNJBHYy?=
 =?us-ascii?Q?K9Wdjb1hCTfWeRVnzpEViJ7+/hyKwgrCH7Z/tFcu+GVzVOiHoOWsoYDmlfTl?=
 =?us-ascii?Q?kXpU3A49pW/5YgRKCZDnE639mLqviy/Zof7A2IYA80CQbi54DkMi0A1rxJVp?=
 =?us-ascii?Q?2I13vxRQd2O5GCVDFU16S+OuzCTejeqo3s1JODoUUcJ+8aAwx8gFHGwy1nAo?=
 =?us-ascii?Q?JJihZbR1xIElBMw6SMOjkMMSQLWk4916ZmCM4hPDADbQUp4Ukw/h9no2Ppmd?=
 =?us-ascii?Q?hwtYOklajxv+ngEk0Fs4moyBsEG41xEGWRCNIOuJhH6QkSgRB0QqrcmAAzT7?=
 =?us-ascii?Q?7pf3oQwmxUlJ/utQC1A/gLE/oHA8ODrHU/KArj3hO9oKTLmDYalJlKHCd0iw?=
 =?us-ascii?Q?G6MXq0XmXGyiM1vOUfhMMX3tgwEtU5/i7+eWTyp8GTO4qak2WlKb4n/RRXMe?=
 =?us-ascii?Q?w4asEKjUbxtOlZs5ev29nxpnkaFJ5KjVT+tQJgvlLrfw3u6JaDlTPQNARs5T?=
 =?us-ascii?Q?Ti/bNeDKIIvO7BGEaCdAAN0KcmD8DxzXqpBSLg2asngkv6lAzGD6M3YTXire?=
 =?us-ascii?Q?4CK9CZmHe/OSKnMLu4T5nGN5TPY4PHAgON/ldOR2ZOwBaFoCTmH2gn+fwT5Z?=
 =?us-ascii?Q?LALv/YZwMJvEmU4o6MAYq/OEOp1mwoTiweWM6yza8Hw05HDBtAspjLa7j39c?=
 =?us-ascii?Q?oZAtc1Uv9R5ZOqsxR50ZhQtS6YjfsrD3AG1DfNFq/UMN21vspWLM0xWEOMbv?=
 =?us-ascii?Q?yHzu1151iPEPbyuvZgbOVunuGRAZiSwwNumRkoB/goy6mOxOJmQD4eLfEfmW?=
 =?us-ascii?Q?AarEOrHjVk+Pr4wN3QnnGUO+xdqrp+Lk3lX0rjClFQYssDJBoi/38PSlSlai?=
 =?us-ascii?Q?UYWIgJQ7m6MpcelnniCjrT/UxvJTs1Yyb0R3pNE3RnsYCpWNg+UVSNptQ2YP?=
 =?us-ascii?Q?jNrMY61wvO5/yk1xsMqplDvmFjBeL5Op085LKtjgx1LdZS388h/7FOWTxqZu?=
 =?us-ascii?Q?/e8gdyTFTMY5xw1o6MwcnfsSFzSkEherotqnfgGHpEPejBVyjqk/UFDxRytX?=
 =?us-ascii?Q?kDXhyPesdXiSkLTJsawFZ88/qC91JzuEJY0BYWd/jxJXXyTALVhxtArkvb9q?=
 =?us-ascii?Q?9PwcA+2YSZBAYz+e+NaemFTpurwNW/Ihw4Q/mWiUWPleLQ/THu/rzoLYrD/m?=
 =?us-ascii?Q?dZXyweUIdDCGIuFtxnTt8JbmwRT4MBLSyJ+yNZkL/KLTOSQeR3Pc57HqmGGj?=
 =?us-ascii?Q?T+pKdzasbIRnTGI0XAquy7EkqUuha2mwyKaRHk5S23ggTsYUAd/OVZAJrvOw?=
 =?us-ascii?Q?/zOCdQDxOLw5JZcqdHhXao3ep9A+KldGRHgHPYzelz/fcX702hEMk67ZsZzR?=
 =?us-ascii?Q?2i6bcktAUP3TNTgsqNh4y/epM0XBx9l1pG1P+CwR+Ye4+Q/rIUDheCQi45Vj?=
 =?us-ascii?Q?YzrqTAweJMJ98finy7Sh0w+z/eCjR+BGGbMuqKhUO+MGRTkJkDoPo5x/AVpw?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	L00D8XhfRneKAW8RKUbSOTLC5UUt/PG2j5nmwTQTKTWV1o2+8SB1UICJ7QKgZC2GsyGCZjbZIgaUDdvQ2UNWKRt8ug7VfEpuXZkP/h61tkytkExcOdsXneiUfQXE5CEhM64H9d5rMUiyPQdpRZFd2icyEaNhmZ7/WhMnVuqfdymP7ZSNJ6ljH71nro64kuToIaK+Cs4wCEvh1JQgxTxM0iWEDmjirw+Ur32q+i6WrpA6oaLwcmwo8J3VwB5tlHf0thXMIuEj7nq/zPk7YsbL2qi1ovNT2Mw83cT0Aq6aHVRUvu3UvHXSXv8vVkUOAIRzjVxFZ+ycXbqC/BIcjynseVZ/59LIuob/tqT5x0HKQby/VLlX1dlfklXUHxfzRcTfYW92mhpx1caWXVrXc67jXxUbyQj5gfUTDRHzoscn9NTG0nrcAyRyg7URwdDlAGJ2uHSi27+D+Y5ttUqWUoIog9xDqb2RQYiVH0rBFndv2Q0WvlXQa2qWl9dCen2A1X43v4CZreVsUdmbc+eNJ3oLwEMHinhoiAc39ugoFgE4OQrOd4LQpLDZyRefzCTEEwLxBqZvSbIxDeS+eO4Xp4cTXuaaLHiY2QzFzuG5qPZfhqQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e326c9c-a382-4f72-1470-08ddda821dae
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 15:57:33.6222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CkpCC0fZ0cKfgoLTGmKOf4qG5gEaV8aHsFJXnUy61vFaGDRPLf2pvdiwN/Nkg0L4kylWBSj+HGeF05UwQvzYXNNN//IcLgt04sfvLN1SthU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6222
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508130149
X-Proofpoint-GUID: oGzmvUIWkzDWn96ysX2FYIcyU03Y8uh8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDE0OSBTYWx0ZWRfX5bJ1mbrTwrHq
 wcSDymRBFej3gDy4+rEIZFppn7+8SnMktBoIq8L/NeASZCS6X4OI/vQlnlGckBsk+CGqIfgbZaO
 4tgpd3ZvmkIbDeR9E3ocbbXiOgljq+v37orcK+G/4LlsXUsluu27gx3vgq0TfSRr+uPGqFrmP2W
 CZKbPOaQNKLudTSDkdSViyMpWdXjzFE7Ae+U1K2CCFsgd0V3gXRqyH2z77nBKdswT22TTMrxEf6
 9FEzr3fjdhDVySEvpk9a5sj3BV6i6qv+9ntNjkgtL6s6Q4Ok84R0E2BVjsSxj3E3oXvQD4f7ZpK
 po42uvUStqftEuLW/6hUJt6BSWbLZenJMImWxXO81RX2LqKzge6fOIOPEJTlTI0ZiGvsZlCl/wr
 CmA6ZLM35qmpWxGGc/A83Y6YwjxLMY2FmPwZb8PS9ruOVxA/Ki1FKMaES1cMndnwqnORsguT
X-Authority-Analysis: v=2.4 cv=W8M4VQWk c=1 sm=1 tr=0 ts=689cb5f1 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=HwifRSL0iPUO3khGZ44A:9
X-Proofpoint-ORIG-GUID: oGzmvUIWkzDWn96ysX2FYIcyU03Y8uh8

The trace("") action would dump a series of 0x00 bytes (strsize of
them) rather than printing an empty string.  While that is the legacy
behaviour, it does not really make any sense to do so.  The trace
action is described as printing data as a string if possible, and a
block of 0-bytes can certainly be printed as an empty string.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_consume.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index edfe5bbae..2dce69d6d 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -991,7 +991,7 @@ dt_print_bytes(dtrace_hdl_t *dtp, FILE *fp, caddr_t addr,
 		    c[i] == '\b' || c[i] == '\a')
 			continue;
 
-		if (c[i] == '\0' && i > 0) {
+		if (c[i] == '\0') {
 			/*
 			 * This looks like it might be a string.  Before we
 			 * assume that it is indeed a string, check the
-- 
2.45.2

