Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4F0341045
	for <dtrace@lists.linux.dev>; Wed, 26 Nov 2025 20:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764187429; cv=fail; b=TnLL5wVY0gJy3lLtbtA71N4Hd6G0Z9TAGGna2L3VAymRoUueA/xMLd1MbsAqkHxM54R5cBwHWlVXffYC8pIgyzxremc/gEZ+Wn6j7tyrgWxYXZU77D9l954j8bohnrTF0uHWgsNK67HCoyCw9qs+DXweBHg4clPnRK4/0XLuyOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764187429; c=relaxed/simple;
	bh=SqB9okHqCxy0mSw6fPnne++kjN2z8kNgCcUPmIbQdGI=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=p7zFMLkuNQefeBJqACoCIp1pY/6OXUIvl+LH4YjUJlO7yieeaiXXUhskW6aXeFqTP3Ma8p3bpGgS4h1Pjn6MQjRisGg4H3jQ/QhSdOS4PPXfjNcNGQbdR4Xtp20bTjd508rwg83P82s9OW8/KMiURXXGt6zzd3Y1cckVLzq1l8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QC6qo8mV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tJlvRqMp; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QC6qo8mV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tJlvRqMp"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQJuIpM3082170
	for <dtrace@lists.linux.dev>; Wed, 26 Nov 2025 20:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=kOIp4lAUH0LwMiPLvGkSroUcS0bEzJvVcCPMLA6p8vc=; b=
	QC6qo8mVjJl35VodBOeIihToqM6LNfpD8A+VS0aFBCK1pV6RNiF7crFVEGlGSPMR
	iekm6cj9ucdYRX8VERn6wNbxFHf0fLzGu0iginrvIOczbwzbHDR9T0bl//ONOwGn
	8NLm3DWYGI+gpso8873NzO5yy9rUg0ls/W+GDQhTjogvn1IAAOk7d5egqfv1PlmL
	K9nA5sTjXaWid/SwXCbAwcgtRkise8GAxEJfuWCVq5TxFXR8lYXGppPzzMSOJWaU
	yBNHzhFlGhGnl3djL+xtKKA8YH5xXk+/maEDzGqP4OaNjn8QONkYHoblM8lC3XWV
	tC4h5lxM1PlF0u15fk16jg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4ak8ddnffw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 26 Nov 2025 20:03:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AQI0v4G032016
	for <dtrace@lists.linux.dev>; Wed, 26 Nov 2025 20:03:36 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012042.outbound.protection.outlook.com [52.101.43.42])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ak3mbeme7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 26 Nov 2025 20:03:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDXuSU/gaKWlyBjQV4HAstPYuGq8Hn3i/xmbZRPaUYW1bvB2XBTyiKNN/WfR88GA5tAHuO3gejhoDKcqcTHexxPPN+dTaNk5aEpePTl+QSk/Kz3sxFtzxqnhIBjqhId8pWuS+kDqIIKvQftb7Z3vCTrtNJYf8WZtBMsT5MFC7k5Ur/825oPmDsYKZgDgFZrStW5sHtkg14IjYoE7H3+gTvVr8rW+iuMc90YBn6mp0oNl8O9Zbgv16NYw+1k8Kz4imNOyogbbO++bJXfkk8Dq0oyC6UhTTGxzKuI1evxVyGSUXz5iZIYu+pVn6QhU4pmr85T1Zn5ypZupKcq6ytK2jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOIp4lAUH0LwMiPLvGkSroUcS0bEzJvVcCPMLA6p8vc=;
 b=d5AZrcj4qr5WuZOmnA29xZ1OBg2LvxI9tq4CdJsMD1MJFoqFxc4DE2Zy6MqIrvqyXoAJo9KoIBOIUHWP45M/EGW0ju6aFsWNlKiGN8/tHSUPB5tYrR1hpsGn67QrSxq++hgVLgTI8+kmAj90pXOX7eg8XJw6Q/F56Y3aaqzVXjWgAs/ga03Cx3iMmsnC0GsBMgfrbs0TdqI+ffnwA/ZzByurT4aBm36tKXNb7IlKJ3ULfAIqQVn3uzXN6/3N5JLxe5miwyIpd4KG0XQSSEB1Qi028AxcCoPoF4UkpLmHQtJXRCAfDB1VAvkwQxB9MQl4t2RhUuWNrse1PN2Iu7maqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOIp4lAUH0LwMiPLvGkSroUcS0bEzJvVcCPMLA6p8vc=;
 b=tJlvRqMptVRnVpj+Iiw+AubxT1TxVuyh5XZqCId2Ohsnw8ay4CXgLXMw/43x9cSBOt8k1Yt2cN4e8QP5gZyut83mqoPFkoRmxMwLahxSgBtWvjL5TPB6QDp57327DWRIXxfcrs5vQoGzF/fLG1Dr51J40F8qX/8bJNXJRiU+4Rk=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by CH0PR10MB5068.namprd10.prod.outlook.com (2603:10b6:610:c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 20:03:00 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%7]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 20:03:00 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] doc: Add include path for sys/usdt.h
Date: Wed, 26 Nov 2025 15:02:58 -0500
Message-Id: <20251126200258.32436-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH2PEPF00003852.namprd17.prod.outlook.com
 (2603:10b6:518:1::77) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|CH0PR10MB5068:EE_
X-MS-Office365-Filtering-Correlation-Id: c5417eb8-124c-47cd-c82b-08de2d26cc9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gRFI2g5rjfhCLqArPUG8qHwkRQqkOK+MyFKo1qyWl1C2+KKHQ6IOavEtnjb4?=
 =?us-ascii?Q?oNIEriXCZNQGhleRPrRD3EsvUM35NtmUpy9BBRJCEPxbB7Fel2jyp2IFK76/?=
 =?us-ascii?Q?iKskaoYqTdnKFaxG2ETj8I21vi+szdHpXsD5hwMd5jE05weFfOF+oeqY/ZDM?=
 =?us-ascii?Q?Zo3VND37kAcuLL47EI8zh7e5c/Y9qEmf1plIRRr1H5UYNh4lvTPOzpwPb+0f?=
 =?us-ascii?Q?US94ERobHVB/rZkDUG+n7smCZ+2dT3oz90NVT+h7q+gWJpfwVF+i1/eCIHag?=
 =?us-ascii?Q?LVbEpqUZOCkDqSPbVy+Bd7clKbQGEl4/qSuuRNs74Vxr5g0Vdso544v7ihQ2?=
 =?us-ascii?Q?eHDgE6OxaRZkhgSO6iv2lFJ/QKkqZkfie6OI5lS5j9SmblU0HMeGCz80+DV8?=
 =?us-ascii?Q?vJLSD67TvwF/MY96Qn1NuRjjLBk0I+hdQkS9q2VcwN5LtwoR69MFRt/rxXWy?=
 =?us-ascii?Q?uHymGuneoIC57SSGYuSZK8Bwt/m2Cl0jYDtQ8ZzkSMO3kj2RwDgmB4T+nsz+?=
 =?us-ascii?Q?Sb9JhJ0bQ/0xMXgDHLpetM1jQbDMx6uVnXJFM/lmoNr17mfwC0w7ctJCTPM3?=
 =?us-ascii?Q?eyXWseI3mSMIk/fL2EQFD2T0+M0s1vwVw61ci/ijXczXauIqFgpfPjTKOhKp?=
 =?us-ascii?Q?zLJgfBIKc5Y7S+d1EYUcKcwP+kBsqAeokDIOxsskcJraTwSvgYsUAnSxIOyP?=
 =?us-ascii?Q?/Jlu2ehhzwf0QG228StDCQoUb8piJZ4fIwo7jw3Ok5q9ph3ir5rVhwDHK6vq?=
 =?us-ascii?Q?uyqNTkm2pa6zJ3o80s43H7lpZlQXjIJ8+e8if9mcjW23UYF4l3Y9Pruf+xnB?=
 =?us-ascii?Q?sleYqNYz3AYNDTrWuUSRfqixEYOJ9j4CFxPgrqu/uF4AvA+psguCL6BD7itk?=
 =?us-ascii?Q?wtl4Lgn2hig2bLyUshbfCPmOv0FWgvk+qBkqOJ8WtH7ZxKZopsVg+8nCBPrf?=
 =?us-ascii?Q?UssMniqNK/mOJG1kJr5Q5PKJqxoOrKUwbs8X/N2rdYy+ItYJtBCjIF6Pffww?=
 =?us-ascii?Q?cdjZerl2m43K91+qDm/CUjyrEdvHjAP296fscXmoB3KIm4z/0SWE/qmgEaPq?=
 =?us-ascii?Q?QcpbiaIgVODXZ/HL8SlSEN88xWwMA/RXxijoUyhsSbI22rrOK7jbo6PDEcFP?=
 =?us-ascii?Q?AiMkZ3VDkG11ZQ3OcU3PRFyjr59Q5QkkEH302D1tI2ZQJzAKUEHRnjX8a3C2?=
 =?us-ascii?Q?NNYU65KW2zjxYE/81SVpAoNPOkw8NZCE9yiNFBSm9yw4jtHmqQrDcOw6Mqrb?=
 =?us-ascii?Q?4Y4Solar0JdE4xB4dyWHDX8IunthWi7dxI3Qe9F044MolHLWdfjLKnDBpQSQ?=
 =?us-ascii?Q?aThdRkpzpwsibMRUK1/hUp+0ymp5hz9g78MLNHwOGvB6nUW6a8RY+uQjoH1u?=
 =?us-ascii?Q?fSRGPZHPN+YU6Z7FaF90zUN8cVN2mAsuStSfeMI8cwf4mzZ1FF5r1TqLTbni?=
 =?us-ascii?Q?e+ecxoRgo3KSlqAHstdf08xKywfN6Emu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UeU6hstWhqUOlyOkZISOuPbegIQNXs0YB3GsBIEPpqGOBVS7uPiW3RGhDvwF?=
 =?us-ascii?Q?0GeQ00wdxsuD9tPhYBNjwkRX8qlXyj0gtf5hdmpPnIaAzRF0Qr+Fo+YyCH+j?=
 =?us-ascii?Q?n8HFSyjtKE6tWBWWy6C1bKGHuhINCgwMIzCwL1JDapAo9QP/RwiwWHG4Thok?=
 =?us-ascii?Q?etifrOt6hJgzyzrFC9yQv2ZjmckUQOg21JA1hH9AyXrdiPpbESzIOgLtpvRH?=
 =?us-ascii?Q?UNEzc3nPg0gvJwg0LujGLJNk/YDHHRJ4AMgxbqSwRE4N0ocZem1o0bm3mzPV?=
 =?us-ascii?Q?N+94o/rlmdt9EohjiOhMsGeyonTLNkTjkUD2ly2mjZ3k+i1grVkTY70nFcH4?=
 =?us-ascii?Q?x902m3DWxUtBr29RrNy96MLsCtholgl8UUei71l/vse3J13d8SljKDQabUtq?=
 =?us-ascii?Q?PhVwL5poTYgFXgq0dCcXDMUXSZfNuELYj8WMI0Sjk2ZPufbxJz3Y81WIGKpg?=
 =?us-ascii?Q?L2P18/i4WMmMwcQk5zMCGPepArFwjm6Rjsh4pU2SzW0gExlWHQ7vHM5GZftm?=
 =?us-ascii?Q?iPzDoTDTh7LU+kJ+cooLMv0/ukJyAtj49ZWBXBjQQdr4x6yIIbj2zNpfy0/h?=
 =?us-ascii?Q?pe7heF7+ExajU//PhgouNrplHN2VBrP33Ws0zG+75jUZ2Gr7ecnGfrKFz/21?=
 =?us-ascii?Q?4RPcBL5cO7aXwgHSq9OrHgTaB5AOZlgUJ12eAeFClBczKkTbkcxUkjKPl8CT?=
 =?us-ascii?Q?1N7ag8S6l1eWM3DUqot26IhqXlNAuKQ5k5bA4ENJGFgWAM/vmtSuxTULNAgi?=
 =?us-ascii?Q?Wzd9ZRmUiexht0/TDvpZC4LX8Z8BT6K6K+b4AcAlSEes4Y8S3kmN2QL0nbaE?=
 =?us-ascii?Q?zp0pti0O2kUq8T+/yl2rLkCu+eR5osHdL8cUFVBh9MxhsSiFYxoohF/w7r50?=
 =?us-ascii?Q?Ri4tdF/9jIG7qiGznAX8T7gQXmbGIYd35PI4W7CAdKbM6DfE6PH0wYLYPLDr?=
 =?us-ascii?Q?EH99+iaNCQIdB6edXYuZaW69ypeO+Nkr7cQZCjOXKtKHZ0DByGzHC9CYBM+4?=
 =?us-ascii?Q?CImS0fqXiBJoMs3HCNLJ8N7LR8OyWLGzfa/SanEwoGl0RyX28nFIC1rrDIC6?=
 =?us-ascii?Q?KlKp8pfttVuJdEpdke/53NVmZowuabnpvgC3kiUUZM8DV3dm0JlMZ/ilk5qa?=
 =?us-ascii?Q?tpOmDWIxzl1YxBXXtCLDAiwCcY56zlqFvUoFpg8K+UeH9E8BLWLfzFSg+Zs9?=
 =?us-ascii?Q?hT0o8VvuQ75nk8/w9KihXsocYNUPWGq9CgFyjJWu4IOFRnkErKG3ea2EiQlW?=
 =?us-ascii?Q?L2h+48aBwczBJEje3iGcmvltS+sLafDEfvH/YQo+4IC9+HgHd1uRNz6u9GWt?=
 =?us-ascii?Q?9pSG8v/TOR2uN5zOTKjqbpayvCRmIpc00oNO2cBPpuVVu9aw8HvfS3RXwjXx?=
 =?us-ascii?Q?dx9IBdfBPWxKNDoX03Lh2QBm7K8INv9G08vscSnsaKl2O0x73ZWjJc/oAx1f?=
 =?us-ascii?Q?qdAq+ieznJbkiMT2d293LoopDE3kWOwsi6Gq+4I6AnUEYL8RfYVPUaBC0cjF?=
 =?us-ascii?Q?28+Hj7466cLBFalrm1cW75YWt9HokpUYVrAZLeE1HTpp63/kPK00nfj2qTpO?=
 =?us-ascii?Q?fYi1PTC1Bv5c2yVpSbhkIIkXWjP1NUbMUed7A+Q/?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6RJ/k/u93nPhbaHgHpvl4ZpQyjOuhmQNZvhmJBtr74DR2wOyUvC99Tn4iSWEzNgs7C0dQvBVLAR+Mlqul9Cl63tq8iqgCo9fjcZeIx8rRkVf5F1d9Q46amD5z3H65nai4/WkKvHrFGxQ5SJuJrKoMo3sg46VHpJOj7ScngwdOT9V3aTcRDYa55rq4avdttZ9Ia0j2fvFa+LNdkeAE5K67I4Z5FB26BpFExXgQDHFjfQrwBlv+4jnxV5zhK+m+wVdZyFqLIlrV7I/Z/wPY6MKqDsfA6zKkAZd0owacH18cNk/JLGjElM5CUdN4sCLe6sol+J5QzCu9pX7DuiMmFFIq17FWsM+9Bobf7p7SgRrOMyRQJou2/TV1aUOov+uRrJeCeS94wjZeOloV37SCjW4O3W7dWTtVdCQJkihOGU1bVkO1KAPps8vdREwIYHr4k1wQaDgfVNsA3f2LhJqTK45VFT187ScV7lZ0H/FKgjXxUO2fPcylNIBBi3kGsst8+t9CLdtCFf+faT4tlin+YQLJMc5IGj0YyHvqAHHMKqn4yn0uUR2W0rns0NLEj5PCnqsfEt9Y7xoeN3Or+nSr8szHtmX0+AHqEe3FjQnq/74+vA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5417eb8-124c-47cd-c82b-08de2d26cc9c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 20:03:00.0302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: evcYSnn7XBl1V64W58B4qmwERpwWU2BXeEhAfCXI77Dgs7l5yN8TaXcmCo9/QwKCuIxpWbh6Cl36RqKz1vz1Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5068
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511260163
X-Proofpoint-GUID: tj8pOa6-8nVlKo7I_NOFGvt1EwsT-2-N
X-Authority-Analysis: v=2.4 cv=ObqVzxTY c=1 sm=1 tr=0 ts=69275d19 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=CQg1fIkjT8O_dvwQHnsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE2MyBTYWx0ZWRfX6Op+kSzs1w30
 PDU42UJvJ6kE9Xe+VkfTlx15aRVQYnVh3HFcLEo+M73hUAbnoA92qV2e4FObB2Gee607GPl8T0a
 e5QPcRNKBKgxHe+UhhcAtzKXuctkQUyKRrB7TGqc4zUeVKOonJIsr3vPSok2FTeb9VIJq3HIVNj
 6ox2m3/tZL9ssfBBzJ/AvFjglb+UKqeWe+GUe9W1nAxpkUuhZAowf+BU0zQu4emUp+7XLr47S2/
 XK+nUzvKiz//HLvA3+PmZd1TCz9nHXtK2NFzgjxRVuxCNsZBngphv8b3IyFbnSvRIYy8t+Pp9Tb
 NtmUnzct79SzjRjasPtGOC4nIKjyWDyqSg+hB0KrgDgYcb4qsdXpUmJBrW7CCc09z7QAWQYbqO+
 /Lt+8RIkOzn9isvCgT4dibrJdUkBLw==
X-Proofpoint-ORIG-GUID: tj8pOa6-8nVlKo7I_NOFGvt1EwsT-2-N

From: Eugene Loh <eugene.loh@oracle.com>

When dtrace constructs a USDT header, it includes the header sys/usdt.h.

Add a note to our documentation that /usr/lib64/dtrace/include needs to
be on the include path for this header to be found.

While we are at it, break long lines of text up for better readability
of the Markdown file and simpler diffs in the future.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 ...ticallyDefinedTracingofUserApplications.md | 109 +++++++++++++-----
 1 file changed, 83 insertions(+), 26 deletions(-)

diff --git a/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md b/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
index e8298dea8..cec7845ed 100644
--- a/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
+++ b/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
@@ -1,17 +1,26 @@
 
 # USDT Provider <a id="dt_ref_usdt_prov">
 
-Use the USDT provider, for user space statically defined tracing, to instrument user space code with probes that are meaningful for an application.
+Use the USDT provider, for user space statically defined tracing,
+to instrument user space code with probes that are meaningful for an application.
 
-For example, if an application has `put` and `get` operations, you can insert `put` and `get` instrumentation points in the source code, even if each operation is implemented on several code paths. A DTrace user could then enable such probes to trace activity, even without knowing how those operations are implemented in the source code. As usual, there are negligible performance impacts for DTrace probes when the probes aren't enabled. USDT probes can also appear in shared libraries.
+For example, if an application has `put` and `get` operations,
+you can insert `put` and `get` instrumentation points in the source code,
+even if each operation is implemented on several code paths.
+A DTrace user could then enable such probes to trace activity,
+even without knowing how those operations are implemented in the source code.
+As usual, there are negligible performance impacts for DTrace probes when the probes aren't enabled.
+USDT probes can also appear in shared libraries.
 
-USDT is for user space processes. For kernel modules, statically defined tracing is handled by the related SDT mechanism.
+USDT is for user space processes.
+For kernel modules, statically defined tracing is handled by the related SDT mechanism.
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
 ## Defining USDT Providers and Probes <a id="dt_ref_usdtprobes_prov">
 
-Define USDT providers and probes in a `.d` file that you add to the source code. For example, a file `myproviders.d` contains:
+Define USDT providers and probes in a `.d` file that you add to the source code.
+For example, a file `myproviders.d` contains:
 
 ```
 provider myprov
@@ -21,17 +30,28 @@ provider myprov
 };
 ```
 
-In this example, the provider name is `myprov`, but, as with the `pid` provider, DTrace users must append the process ID \(pid\) of the process or processes that interest them. In contrast to the `pid` provider, the USDT provider descriptions can use wildcards for the pids. For example, specifying `myprov1234` traces this provider's probes only for process ID `1234`. In contrast, `myprov*` traces this provider's probes for all processes that have been appropriately instrumented, even processes that haven't yet started. Or, as with the `pid` provider, you can use a symbolic pid, such as `myprov$target` for the process started with the `-c` option.
+In this example, the provider name is `myprov`, but, as with the `pid` provider,
+DTrace users must append the process ID \(pid\) of the process or processes that interest them.
+In contrast to the `pid` provider, the USDT provider descriptions can use wildcards for the pids.
+For example, specifying `myprov1234` traces this provider's probes only for process ID `1234`.
+In contrast, `myprov*` traces this provider's probes for all processes that have been appropriately instrumented,
+even processes that haven't yet started.
+Or, as with the `pid` provider, you can use a symbolic pid,
+such as `myprov$target` for the process started with the `-c` option.
 
-The provider definition lists its probes, along with any probe arguments. The D compiler converts two consecutive underscores \(`__`\) to a dash \(`-`\) in the probe name.
+The provider definition lists its probes, along with any probe arguments.
+The D compiler converts two consecutive underscores \(`__`\) to a dash \(`-`\) in the probe name.
 
-This following example runs command `./a.out`, then traces the USDT probe `my-put` on that one process, displaying the two arguments to that probe.
+This following example runs command `./a.out`,
+then traces the USDT probe `my-put` on that one process,
+displaying the two arguments to that probe.
 
 ```
 sudo dtrace -c ./a.out -n 'myprov$target:::my-put { printf("put %d %d\n", arg0, arg1); }'
 ```
 
-The following example traces all processes with `myprov` probes, even if they haven't yet started. This example uses the `-Z` option of `dtrace` in case zero processes match at the time `dtrace` is started.
+The following example traces all processes with `myprov` probes, even if they haven't yet started.
+This example uses the `-Z` option of `dtrace` in case zero processes match at the time `dtrace` is started.
 
 ```
 sudo dtrace -Z -n 'myprov*:::my-put { printf("put %d %d\n", arg0, arg1); }'
@@ -60,15 +80,27 @@ void foo(void)
 }
 ```
 
-This example includes a header file that's automatically generated. The name of this header file is derived from the file name that defines the macros to access the probes. It defines macros that provide access to the USDT probes.
+This example includes a header file that's automatically generated.
+The name of this header file is derived from the file name that defines the macros to access the probes.
+It defines macros that provide access to the USDT probes.
 
-You can place probes in the code, referring to the probes by using the macros, which concatenate provider, and probe names, and converting to uppercase. In this example, the macros are `MYPROV_MY_PUT()` and `MYPROV_MY_GET()`.
+You can place probes in the code, referring to the probes by using the macros,
+which concatenate provider, and probe names, and converting to uppercase.
+In this example, the macros are `MYPROV_MY_PUT()` and `MYPROV_MY_GET()`.
 
-An optional optimization is to test if a probe is enabled. While the computational overhead of a disabled DTrace probe is often similar to a few no-op instructions, setting up probe arguments can be expensive. In this example, `bar(1111)` and `bar(2222)`might be costly function calls. Therefore, for each probe, DTrace also supplies an `is-enabled` macro, named by appending `_ENABLED`. In the example, `MYPROV_MY_PUT_ENABLED()` for the `my-put` probe, to help minimize the cost of any work associated with disabled probes.
+An optional optimization is to test if a probe is enabled.
+While the computational overhead of a disabled DTrace probe is often similar to a few no-op instructions,
+setting up probe arguments can be expensive.
+In this example, `bar(1111)` and `bar(2222)`might be costly function calls.
+Therefore, for each probe, DTrace also supplies an `is-enabled` macro,
+named by appending `_ENABLED`.
+In the example, `MYPROV_MY_PUT_ENABLED()` for the `my-put` probe,
+to help minimize the cost of any work associated with disabled probes.
 
 ## Building Applications With USDT Probes <a id="dt_ref_usdt_build_prov">
 
-The `dtrace` command becomes part of the build procedure, which can be thought of in four parts:
+The `dtrace` command becomes part of the build procedure,
+which can be thought of in four parts:
 
 1.  Generate the header file that defines the macros to access the probes. For example:
 
@@ -76,25 +108,38 @@ The `dtrace` command becomes part of the build procedure, which can be thought o
     dtrace -h -s myproviders.d
     ```
 
-    The previous command produces the `myproviders.h` header file. While `dtrace` requires root privileges for runtime tracing, generating the header file doesn't have this requirement.
+    The previous command produces the `myproviders.h` header file.
+    While `dtrace` requires root privileges for runtime tracing,
+    generating the header file doesn't have this requirement.
 
-2.  Compile the source code, which includes the `dtrace` generated header file based on the provider and probe definitions. For example, for several source files:
+2.  Compile the source code, which includes the `dtrace` generated header file based on the provider and probe definitions.
+For example, for several source files:
 
     ```
-    gcc -c func1.c
-    gcc -c func2.c
-    gcc -c func3.c
+    gcc -I/usr/lib64/dtrace/include -c func1.c
+    gcc -I/usr/lib64/dtrace/include -c func2.c
+    gcc -I/usr/lib64/dtrace/include -c func3.c
     ```
 
+    (Note:  The include path is for the header `sys/usdt.h`,
+    which will be referenced in `myproviders.h`,
+    generated in the previous step.  The header file
+    is also found in `uts/common` in the DTrace
+    source code.)
+
 3.  Post process each object file using `dtrace`. For example:
 
     ```
     dtrace -G -s myproviders.d func1.o func2.o func3.o
     ```
 
-    Again, `dtrace` doesn't require root privileges for this step. This step also generates the object file `myproviders.o` from `myproviders.d` and the other object files, linking provider and probe definitions with a user application.
+    Again, `dtrace` doesn't require root privileges for this step.
+    This step also generates the object file `myproviders.o` from `myproviders.d` and the other object files,
+    linking provider and probe definitions with a user application.
 
-4.  Link the final executable. The `-Wl,--export-dynamic` link options to `gcc` are required for symbol lookup in a stripped executable at runtime, for example, when you use the D function `ustack()`. For example:
+4.  Link the final executable.
+The `-Wl,--export-dynamic` link options to `gcc` are required for symbol lookup in a stripped executable at runtime,
+for example, when you use the D function `ustack()`. For example:
 
     ```
     gcc -Wl,--export-dynamic,--strip-all myproviders.o func1.o func2.o func3.o
@@ -152,7 +197,7 @@ The `dtrace` command becomes part of the build procedure, which can be thought o
 
     ```
     dtrace -h -s myproviders.d
-    gcc -c func.c
+    gcc -I/usr/lib64/dtrace/include -c func.c
     dtrace -G -s myproviders.d func.o
     gcc -Wl,--export-dynamic,--strip-all myproviders.o func.o
     ```
@@ -168,7 +213,12 @@ The `dtrace` command becomes part of the build procedure, which can be thought o
             tick-5sec {exit(0)}'
         ```
 
-        This first example, runs the `a.out` command with the `-c` option. The `-q` quiet option suppresses extraneous output. The D script is on the command line, and it prints both args for the `put` probe and reports the `get` probe. The example refers symbolically to `$target`, the pid of the target command is specified with `-c`.
+        This first example, runs the `a.out` command with the `-c` option.
+        The `-q` quiet option suppresses extraneous output.
+        The D script is on the command line,
+        and it prints both args for the `put` probe and reports the `get` probe.
+        The example refers symbolically to `$target`,
+        the pid of the target command is specified with `-c`.
 
         After five seconds, the `dtrace` job finishes, ending the target command.
 
@@ -184,7 +234,10 @@ The `dtrace` command becomes part of the build procedure, which can be thought o
         kill $pid
         ```
 
-        In this example, the command is already running with process ID `$pid`. We refer to the specific numerical pid that interests us. The `dtrace` command doesn't, in this case, end the process of interest. We handle that separately.
+        In this example, the command is already running with process ID `$pid`.
+        We refer to the specific numerical pid that interests us.
+        The `dtrace` command doesn't, in this case, end the process of interest.
+        We handle that separately.
 
     -   One more possibility is to run the program using:
 
@@ -196,7 +249,10 @@ The `dtrace` command becomes part of the build procedure, which can be thought o
         ./a.out &
         ```
 
-        In this example, the `-Z` option allows for zero probe matches at first. The probes match later, when a USDT process has started. After a short delay, a USDT process is started. At some point, the USDT process is ended.
+        In this example, the `-Z` option allows for zero probe matches at first.
+        The probes match later, when a USDT process has started.
+        After a short delay, a USDT process is started.
+        At some point, the USDT process is ended.
 
     In each of these cases, the output is printed after one second, and looks similar to:
 
@@ -217,10 +273,11 @@ The `dtrace` command becomes part of the build procedure, which can be thought o
         tick-5sec {exit(0)}'
     ```
 
-    In this case, not only does the `put` probe not fire, but also the `is-enabled` conditional `MYPROV_MY_PUT_ENABLED()` is false. Therefore, the `bar()` function isn't called. The only output displayed each second is:
+    In this case, not only does the `put` probe not fire,
+    but also the `is-enabled` conditional `MYPROV_MY_PUT_ENABLED()` is false.
+    Therefore, the `bar()` function isn't called.
+    The only output displayed each second is:
 
     ```
     get
     ```
-
-
-- 
2.47.3

