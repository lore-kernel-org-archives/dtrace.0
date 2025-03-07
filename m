Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1E31AA1D9
	for <dtrace@lists.linux.dev>; Fri,  7 Mar 2025 21:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741383296; cv=fail; b=jVC/D0rgFSlesiM8SOc+S/buWJmjQgVmby9cNSrw2mtYo0rNnjIQHqOl4nejMpS7ItZdW20B+NYfstwL8bwEjrRIiCidaX8dlBWhNHCO57/UCWKn84sLrEAGpX2RLK16UI5r2ve1CY4Ok59HDGMP3tMQcIgHh6+IQZnmoOiyh2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741383296; c=relaxed/simple;
	bh=rYBwJHSYgVMp4Z9L17KD0XWy9iyyVT5NJffCG4TZoA4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fM2dDSGMQ0ED/bY2EQpKNuaDl7g5etanWFx+ToxIBfP6sO89cy4A5kUPsWOaOYCXdaI3sTyhze5JmKEu9Rsy0nZ0DIXn9lwNOhtwpqafCYXodNbXfZmFt5zRbDnbKMHKd5CBSImOQU7jyOpCtR7EEZaTeQ+UMZ504/uHbGzpn+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ayUgi4UO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NXc0e3Up; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ayUgi4UO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NXc0e3Up"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 527LIvPm021701
	for <dtrace@lists.linux.dev>; Fri, 7 Mar 2025 21:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=LHaLUa2KdBRQ02s6
	qy/Lbp5aR6QYZBYHAV9Mj5sRWUs=; b=ayUgi4UOq08Khc8InxeZ66AGxNP2d9NJ
	u4pbT3JPGN9v76CgDU+H7AQdgc2po4Hc6eOM3zLZZBaW9IPyJxMv/Tr1VUiBg+sa
	XfCxACWyQvvLMCPK6TK8ggmqtJV6ZWkdZEMAkWXcJScgTqN3i4imzNBs7onjfVoM
	J8uLVGAH7Q9F4FWXG8BPncXlWJ6QQWBHjtVJGYxlfUo8eVR7Zek1SpJetr2/0SBG
	D2vxclKQzQfsFACUMkeZgWGG9YNuH7X9wMXtiezsAWATW6ghNscqYhsae+xHT8Ym
	c588MuWqYnZodAlQOWJeoGOtCIOigaqjDVRQVwRELfrUPqspOS4S/Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 453u86w0wa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Mar 2025 21:34:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 527KF4EU038255
	for <dtrace@lists.linux.dev>; Fri, 7 Mar 2025 21:34:53 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 453rpmb3tf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Mar 2025 21:34:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ghDPDh5kS1MVWx2fQlk4NHVMElXiwsvcJyWY0ggcWrUfH1Kumt5PfaYJZMjZN3PqRAjVWZFXP1sL9KyqC2Yz66F9y56hhjGoO4X0kx/XzEeWMxzs0Kwwz/kRpNIMJngwgWWSziISBiNbJtMOSh4MOSgRvw0YoToLuxdf1ixRvWXhApvmb2EuQoHVi2bUZBBQeSqifmnUEi010bRTV/UTSoyvqadulS2vDblkifl6ANIjPrFuEX3QuHMhG2B4gIlfuWSunoy0nXfNZtHgoVoADkXAx8nPaNCPBjc3i8vKj71XrbhPwmsVYvGvb2qntjz21c3KqTQrjN9askP4kQCqHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHaLUa2KdBRQ02s6qy/Lbp5aR6QYZBYHAV9Mj5sRWUs=;
 b=QrqLsUDuiJ5rLpyYod39jPxEYQmKls8ek9sk0rqCfsZ3z6sDPb0aOU8OFPpMAO4WK+D7goTjhDO6WM+yP5/jUaqe/f2JYy3pFXiH96PcxtD9KVD8cjUJDCjqXRmHqZajLlBNaIwnu5zH6jozu/ADm5BW9CCvxYrrGp/6T2X0MTQlBRFkoenlwo3RCCDzLWFQ6bZRTsqBNHkXhVWQzZlCHEB04oy6hDpzFLpL1z1AjicKDuW9qzylRsEBipFLpg9+nP7pT+Brz3akreANE3lzDl4h/+qc1zYrLyeOKwpjCfbVpzTXTxGxKJrUAYqT08Vh0w3M9cnbXlselCGdTUt2gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHaLUa2KdBRQ02s6qy/Lbp5aR6QYZBYHAV9Mj5sRWUs=;
 b=NXc0e3UpPT9t3pVz1azJsK1GKqgTveQVKweWUjMYIMyLP/8dKofIVQrPQ7mBPeLUtfHANJL2y0BLUrqaVYXFsnyi6LZ8zCnOsX/QsWbhnjQP4sL2OUsn6WHo1R0e9KJdiojGb2Hv9AoNskcfay7F+kY9QZwb8N+rpGlLFmY5NEw=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SN7PR10MB7029.namprd10.prod.outlook.com (2603:10b6:806:346::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 21:34:51 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8511.019; Fri, 7 Mar 2025
 21:34:50 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH 2/8] sched: clean up unnecessary includes and functions
Date: Fri,  7 Mar 2025 16:34:35 -0500
Message-ID: <20250307213441.9495-1-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0367.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::12) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SN7PR10MB7029:EE_
X-MS-Office365-Filtering-Correlation-Id: 0943f4b4-dc48-4db3-f7e3-08dd5dbfe452
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7sa3x6PlqTF/FanJj/qfYZdKpNmQWLju3BmLugHM13j+TZuQHj4l/EpdwsLJ?=
 =?us-ascii?Q?AjJoE/gyutO2kUh4D0EwTdBaNsnE/PqbfvOqYHXYDv5CAaOmq9PtSagOM7ri?=
 =?us-ascii?Q?HUKikz0+N/pHVfZ/HDXKv/W4zeklu3O1jCw9icq39PyApbI0lSQqPSHxX7Gr?=
 =?us-ascii?Q?ERpssHB9QGBSz6G5GHBtSxI52ZxFio+OgC+N4VVW0RmTiSIjI+hmgWrKc9w4?=
 =?us-ascii?Q?4pcB1aLHccPbxF94kSlKmCYFXzLSHIB8In6RqrWf7s492hWJKGx8jhDTR/+5?=
 =?us-ascii?Q?3X6SB0Wns6SiNNVP8E4Rae8pmL+8DOSTm2XE9sOMN4qKbo0TTPAAga9plIDB?=
 =?us-ascii?Q?WudHeinjiyGbISOFrQP3RK3Z8TyZOg5m1JW5OEFlT/L98gsnZ7dF6ugZmVu2?=
 =?us-ascii?Q?Sgs3bejtqm5J5cWir5M05coALiyewVqRojjtGOGHR0cj03tCzKKLg2z0y+aV?=
 =?us-ascii?Q?EGult1ELptIXXUUVtAo0MenGmySHICun+45I1/WHeNapyHNcI++cU6u4We3I?=
 =?us-ascii?Q?NzkXN0O9X2VEc8cvEJVdfxN5vdW2vyvqfELj7BMNM4Yc0s5pIttZQD2ZV7Gz?=
 =?us-ascii?Q?9u9YqKCTifJA6mV163/duv3MQaFhYdIkM2cJNHhJr7q3A3IfF8EEaMdbxWEQ?=
 =?us-ascii?Q?RwAbZEzbeT6vFDilOUOIp5dRgw+40tMmr1/PkgKbOrQkWRo/SkYcMks6N7v8?=
 =?us-ascii?Q?CDOF/yGSGz8Te/1Gh296+4adOKqSbPabKYqXwM6lr50o/xM0XBZg1RG9dUMK?=
 =?us-ascii?Q?vAkQkPC9WvGBk7KRD7CZealZBp0ye7wmWPTh58AVOU+z54e4dC6akoxLZpyx?=
 =?us-ascii?Q?jwJ+9NjDQvFaJvuDqn4f1UiS/DIZHWQgiDwd1PNjo7/N0FFaRJew/LFxQTGJ?=
 =?us-ascii?Q?AJwjmDru3TlZy6E9XBCs17HzbFDw2RSHUxoxAGmop4hzeA1X9n6w5MPcV1So?=
 =?us-ascii?Q?wkO+j3QLd5QLBizI7lG7zWUYk1+fE94xbFsRK4cCXvOitv2VXb2sK7LSvKhg?=
 =?us-ascii?Q?smKPHNFimMXuE9kwGuRzYjtJfvvuFcJ6UdBuJRzzPNmXpifWssTy+2IjKdsH?=
 =?us-ascii?Q?H6x1Xa5ahPm1WXwdzeCRmj/S0iQsYnHwnLuhSZhfk/sn9cgKFFERdBLLWpie?=
 =?us-ascii?Q?rgYG+mk7wS2WODcfIci6VOz+iAsLt391J/OdtKxaTTMq1Wnwb4FdmPrJDx8H?=
 =?us-ascii?Q?8XFp4x9usAdNIBbWzhJpF83U1o6V1GmOz3fhvQAS+7COMwidgjgJMnm+O831?=
 =?us-ascii?Q?JY2rPlFB/cFle3ajHND6TCHddEqHi3kxOR0fJOx/xi1A2ZlOgL6BTXIxWKVd?=
 =?us-ascii?Q?YpDhpLb99pwxPRDM16vGBlAh3775LjG6y+h1s6xHVwQCXR19R3va7AseFKjF?=
 =?us-ascii?Q?r9853y6pNwQeryR2A/fNlboE2qKN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UrL3beiQBecpUgCUDoJDGG0xJoOvWsoi/x97xQ0qQWmvOhsRShucqUa717pw?=
 =?us-ascii?Q?wWtnkREZ1KD6u83rDr1H6DLqymaQqCbuXdJ0zEDwFhK9l5frefiPizJ1vj64?=
 =?us-ascii?Q?56ULoLhHv59Lk+j4msOI0q0nbFHwUldqw4JNfhMMMgMBf5DZDYtyfukG7klP?=
 =?us-ascii?Q?BjF+2Gton/XVdhMI1XHzEZuupjXqBCJjesfCjlbHcTQwOk0JzeVhiSV3K/MD?=
 =?us-ascii?Q?TSd3joUaGQghf+GB85idKKSjwZnAk+huTYFabh7JTKbX1AgRZeF9NTQM6mdq?=
 =?us-ascii?Q?7WbQHSNidNNwF3b4I4AukY3Ol8Q/8QIM77OZW02zeCEaPZCQWjpMW+RoAHi9?=
 =?us-ascii?Q?cPLOUwFXPQfqUrQn7DJ7m+XSl0+x5VmMFrnu//PcRJcXCfskiD8M0mfPu3Tk?=
 =?us-ascii?Q?YhuULhSwdCkVTO2R1f3b2Qt/AMkuJ4ToMXn6UcdK78JZ7uhkhltxmwvgaGF1?=
 =?us-ascii?Q?QDdWqJ/Bw+0ppck4Ae4CgebLncd6XaVaZQj/JbAyLQ2LrOrcigFK7PIje8pT?=
 =?us-ascii?Q?Erf8JEYkrOLqdz/5yWhKkVWgl5SOApZ7C8cRiCTQH4bUOG7hLRLiyZOU1LA8?=
 =?us-ascii?Q?rWwPvzDjsIRU8uOFx6AxENQ+/n/SrIxcAIsTSO1F/AaPiRBLmggj9cDob1kX?=
 =?us-ascii?Q?dbBo71xJO28QDo954H3husN7ce4OmLl0Go3W83RynRH03RJifU46VYJeAFGD?=
 =?us-ascii?Q?YBIgwtMS9CtgncSxncctWuo4IRrdXm2uouZNEJUjYNZP0CUMgBD5T34AyWCs?=
 =?us-ascii?Q?mkUneGeuoDVHbEx8Dd/g+W4xxeDF1T4eLtSLEob5aVxpGmt9+OBM4/OqtcXh?=
 =?us-ascii?Q?23VW/YKSQ+aKopUAL7JolEGVj22NOynVDhMrz5Nm8/jFzdWbz8jUBLHcfLNK?=
 =?us-ascii?Q?5e/WCdNzPDmsKW0OXDizUww+PeJbTMNNmcYqIuFP83ZpWCbkFo+7iilxQH7H?=
 =?us-ascii?Q?3AX5jY5E1smgGzyryazJYchJjKCQ38BlKfv8Egnv5lqzh+KjBrkGtfvEwpE1?=
 =?us-ascii?Q?blEiWp/f5KuTC9vN2akLScEVt/pmz/oWzPr19z0HO2JBlDi8MG6djt4icCMw?=
 =?us-ascii?Q?/KDu4CMM2tn+Mz2QJSyMiFv+kgB+tpkM6JKQ/33sNQ/7AnuD+lKpqKOQQLZ6?=
 =?us-ascii?Q?3XSpHCqFlPyu4SVpbXF9A3tXX34qHXmzMXzCdvBMFFkZ1l0DefKBBMnAsSBB?=
 =?us-ascii?Q?OJTD5dLQVBPU9tGr4WY7NuukuBKAlnOXlAivTBsdf25m1wW+VUS0z4d6TuUE?=
 =?us-ascii?Q?MjWjvg26Ivbj4kd+jPoaR9z+0BZm4PiVjFltxHoGYfQZZMIEJUDweY6xwV1e?=
 =?us-ascii?Q?HNCSNdbw2frwOKzbnHMnRd3JTSdgSh3zIQhNqgD3IIbefTIWGntWm9QW8uoO?=
 =?us-ascii?Q?/AEaKZzxfEnQWjDmFmXnkQOIgiQFwh2GpAKgHo2WClG/3jHDza1619yaX2yZ?=
 =?us-ascii?Q?PaXKYIb2qdXknKdcaBGbbhK7sy4JXyXkjdtKtYoz7dnk+gmIkWcW8U0+GkLr?=
 =?us-ascii?Q?AsDhvGPpuqgTb/adiH5A975Z9c901QD7KotN34har3o3POJjN6XjFM2S5r0o?=
 =?us-ascii?Q?EgAWEXPE2bOQZOEp9dC2Z18j9HC0qeUss6zIfRHWzLvepK6QHQ/dXupc1Rgk?=
 =?us-ascii?Q?KiZ5uRezHFKRgRZ39ajhwHQ=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	z2mpSId9kHlEwN+DdnDphkSxXVZJvLMFhfpenRkX2voli+TFDqEN9uGfB88RuQmhqeRBATRQnOgh26IuUXgtZvz7fz/bRE2Mr+lqLbHbzr/WejANmF878T6mQt47G7dgQCxSGvigT0jiBCt8kTV2EdkxwNHIwDZ305mlZLCxpMVHMo4teh8g0PS75B+6sZNpoX57HUcbXs+LWQLDtRLkvjmAppBiary4XqvRLtu8HC2fm7PL7kJmWQXxDca7c4In7b29lS3IJQVKJznUgwR/FYZxSVHcvIcMrg7EGu4srD2nhzpHgQ3KMDzz5OqNGSqnj72y/j38ry4PHnUIXSZcBpEY96CecDVlzh0L54Qs0s+MLRpp364Kazj/E33jHM+YUQy+iEbTONH4yeqDE8JJ3yOVpJuAxl3OgV+CT6vaJv4uO6vji+1GCylQcfmCqarmllakmxzMDW+dhLqEXx5qm+vmJntK07pusexFNUzbjo9MYDfCKR7ZLg/tZf+V0XaN0WTqAsIgMFpvUvbEJ0EXDjoCKqhCgQql07jrK+JnaRbGJsQiJ2Z+EqepuOWiH+aeyvKI9pAky3J4TvzloEWV3ZJb9PZmYrG9RGcQOCfz3Ss=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0943f4b4-dc48-4db3-f7e3-08dd5dbfe452
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 21:34:50.8232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MfOuVIGvUa19PxkZ19kZ1+MrE25CrPpQLxR2koJ6b+lDqG9n+NCKg8LlDAn4yhtbfppa0c5+ESRAzGr8wgj2CwGhDjx2Eg1233ZbapKwiC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7029
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_08,2025-03-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2503070163
X-Proofpoint-ORIG-GUID: 76gCg8LzR90PQ8NR4_4c2EskKlxoVltv
X-Proofpoint-GUID: 76gCg8LzR90PQ8NR4_4c2EskKlxoVltv

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_sched.c | 30 ++----------------------------
 1 file changed, 2 insertions(+), 28 deletions(-)

diff --git a/libdtrace/dt_prov_sched.c b/libdtrace/dt_prov_sched.c
index e05ef246..125d5891 100644
--- a/libdtrace/dt_prov_sched.c
+++ b/libdtrace/dt_prov_sched.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2023, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  *
@@ -9,9 +9,6 @@
 #include <assert.h>
 #include <errno.h>
 
-#include <linux/perf_event.h>
-#include <perfmon/pfmlib_perf_event.h>
-
 #include "dt_dctx.h"
 #include "dt_cg.h"
 #include "dt_provider_sdt.h"
@@ -146,36 +143,13 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	return 0;
 }
 
-/*
- * We need a custom enabling for on-cpu probes to ensure that the fbt function
- * __perf_event_task_sched_in is called.  __perf_event_task_sched_in will not
- * be called unless context switch perf events have been enabled, so we do that
- * here by opening a context switch count perf event but not attaching anything
- * to it to minimize overhead.  The alternative - attaching to
- * cpc:::context_switches-all-1 and weeding out on- versus off-cpu events via a
- * trampoline is too expensive.  This approach works stably across kernels
- * because __perf_event_task_sched_in() is not static, so not potentially
- * subject to inlining or other optimizations.
- */
-static void enable(dtrace_hdl_t *dtp, dt_probe_t *prp)
-{
-	return dt_sdt_enable(dtp, prp);
-}
-
-static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
-{
-	if (prp->prv_data)
-		close((int)(long)prp->prv_data);
-}
-
 dt_provimpl_t	dt_sched = {
 	.name		= prvname,
 	.prog_type	= BPF_PROG_TYPE_UNSPEC,
 	.populate	= &populate,
-	.enable		= &enable,
+	.enable		= &dt_sdt_enable,
 	.load_prog	= &dt_bpf_prog_load,
 	.trampoline	= &trampoline,
 	.probe_info	= &dt_sdt_probe_info,
-	.detach		= &detach,
 	.destroy	= &dt_sdt_destroy,
 };
-- 
2.45.2

