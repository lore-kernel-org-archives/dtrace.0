Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2DB17B418
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 12:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753188279; cv=fail; b=s/J2ELj6ARGQrTgh0Uye2A/h8eoRTDocmS41kia4JX5mp9LPQhxnN2hRLbWDTnIIPQvVG/M1s2r1PNIufYlSMORxddxEBumgn/jPc5p9rpwDpFeXN7F9gkM7Zif6WPtELU5wVNXPm5/5S++Uu7zlRbBt6xS6te7b5dUz7cgZegQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753188279; c=relaxed/simple;
	bh=JvbTNy/zmt/9u3hEtqzWGS+mKTBdM0ZxMOOFd0dl4+k=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=KMrv4mxi5ulTbDjaukr4ePC+jglE3WoUibqO3hY9SYMlvwjU2A6eb04g9LZtm+R2sqTGKwyOF2O1n5U9FSvy66CGPtBgEpROj2oAy7SVkpS6yHBGmS1rdFFzy+As02SYiykDMmpq0UgWmkwtzK9nIabT1A4bTpus8dyzavMLGxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gX5XFNbR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oY6MMf1s; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gX5XFNbR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oY6MMf1s"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M5TBpV002513
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 12:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=JvbTNy/zmt/9u3hEtq
	zWGS+mKTBdM0ZxMOOFd0dl4+k=; b=gX5XFNbRx6fKJwuDc50E57ovpSBm0Nv6Dp
	+cZBtScdb1Yc6jWC1cS9pC56qIz7DopcmS63FVZ0SLp9G3sSk76LUDrudMv0mfHp
	+3Va13dj/z7vNwMwTDu+VJKaadIaW7sUJJ567XLv6qZqcSq/70m3e+Iq83ont6qN
	CkqP6nB21ALfb5xJaBAzTAeFLim/xpcMZMs5Phj9OAiejl5l4bB1PEpU/cHa0OMy
	PdMf6+rmLnbnnE48yV+pGE+jNPWS8OiGVgsvRHo4wne16HVpN9TbKugYh+WA3a1F
	+Yz1N8B35J0Q1iNlSXnJn7PhZBOhubWNbxlgxeaGmJz14nHWcryQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805hpd5ct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 12:44:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56MBA3eY037738
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 12:44:35 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2041.outbound.protection.outlook.com [40.107.102.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801t99sce-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 12:44:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNnqaavYPKilLFBZZYG3S6M48qMEelyQsPgR4i8Fi1CMXCfF1RPz3HQxgqMWoBWOxKOKSPZXm9espYO/vHZcmw5HLT+bu3AVF5PPS+ZPzwSppy8dxkSBxNtY37VDRIvjy23XkahC2bxmzHftbSI4+3OU3cOHJ3rOj8DZu5NdUAzrfoJ2C4pMxd6Rgq9ex92iMDEx//YNwcQSL7aZa94OuWh+sKUBHZKR/CHn+Cr1RPqx3QzmF1FUgOYsBsmBnwsb1PX5KgctB9V5Tsj9XhcPqhhImizLlhxn5weOgbO60sDngrSbnkn7NLU17SqrJbSG6y72nWb6kKxPbnyT9Zq+hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvbTNy/zmt/9u3hEtqzWGS+mKTBdM0ZxMOOFd0dl4+k=;
 b=wY3tKezgo/iOHtN14MDk89nV6QURXI6ZadocRqCP4Q99LoGsbavsep3rllN5/OjcDvRHkpAFTD4/f2sKI3bf94nnHlk2UAeHzZWwHfiGIY3MUrgGPuO4E5L3F8XFRA/eYUBkuQnnHLw67s7PsLRsyuAkQ6kVbUnp3pnj5nk/gWKnuvb447f6PZDV8iw/QZCAkEjiafYu04zH0MO1pQ+9XhPTQwCaXhNQ/sI470x6LkwqFwGeiUR8hGCiMX7JbnSH7SWI2Ck/AaoPRV4I9/QdiuEnyg+bxb7PWWvFnRgDeqK1lAadV99N965wrdJMKlrjRoQxeioKwOlWLQdIGfZt+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvbTNy/zmt/9u3hEtqzWGS+mKTBdM0ZxMOOFd0dl4+k=;
 b=oY6MMf1snYVqVCLG/a/p8ebn8pP9jNDNxx0/cgCbgTp+s7MZa6nHjMryqoe89o1T+w92YFMJ8vD1OqQuAMNJkk96To9jQsNU+BDpJhiPqgfYXG1unhW9yLr1UFWkziPFNe20akYyZWc23B53cz0WAe1PIHpBIllY/9iJyCL10N8=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by CH2PR10MB4327.namprd10.prod.outlook.com (2603:10b6:610:7b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Tue, 22 Jul
 2025 12:44:33 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8901.021; Tue, 22 Jul 2025
 12:44:33 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Extend timeout for many-pids test
References: <20250625060305.15707-1-eugene.loh@oracle.com>
	<20250625060305.15707-5-eugene.loh@oracle.com>
Emacs: it's not slow --- it's stately.
Date: Tue, 22 Jul 2025 13:44:27 +0100
In-Reply-To: <20250625060305.15707-5-eugene.loh@oracle.com> (eugene loh's
	message of "Wed, 25 Jun 2025 02:03:05 -0400")
Message-ID: <87ikjk5r9w.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0124.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::14) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|CH2PR10MB4327:EE_
X-MS-Office365-Filtering-Correlation-Id: 9554f321-fa30-4aea-e16d-08ddc91d8201
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mXKAAbjIppA8OgXN605LoiYmtIkPr+EEFtwPZwsagJvBdYMQZUwqH50l/osA?=
 =?us-ascii?Q?BGpzrWHD3a/BtSqkoQ+bRoY+4jziY350u/Tm2btOD6AIqRsib5F9/gC402WO?=
 =?us-ascii?Q?4jqfj7etHrjHCycgO7D97Cz2l0DvGyoZyhxXfn6vFc6Ug5to0MkyX4bdkMlt?=
 =?us-ascii?Q?aMIkHuvBexzaHyBhlJ8OtEGoKmevw2fSDrcO7mSRqA4av9RizxsDYo4VTlZQ?=
 =?us-ascii?Q?MRHVWQr0O7HA6xG3MZDUAk4s5qb15SuuJcfX8KoKzaRUBaspHlS7SGlhCOaA?=
 =?us-ascii?Q?8HUHi3LU/PFi7xx2ioOd64t93Ok8n0UGXYSS1pNmNdHoO38KfZ3Jylkdb7Qt?=
 =?us-ascii?Q?9Yzy0eThpoZBQWHXqk2UMI9tb8zOoINbH5VI9M/+irjZMJNXHaxSb/0+cKsl?=
 =?us-ascii?Q?g9fY3qcD0e0ID3jngxfulbFT7bTeKXjqyLSjJWPn23iJtoa7DhP9chf02sTz?=
 =?us-ascii?Q?u+GAVuDuRrDOTfPXXd9xILp8ODA3qrgDtKgSfOrFKszXFv4XilkEAHqffbWw?=
 =?us-ascii?Q?PRtJ7oM+QrjiZ1WG5XqZr373n6mvEMLBRyuZR4XDyCSlatu8NDIy+Mg3aXSh?=
 =?us-ascii?Q?72JI7VlttoeEn38lm+rn0syzHnNc5Ae8D/vaWnx9ZNdhWN21GXKZdZ/vElXN?=
 =?us-ascii?Q?HGD5JTvCekurgWZbh5TclDIv/U2NiiafurUe5/zGPrKXJzV2XYgHh8Rw0Of2?=
 =?us-ascii?Q?HQZERLr4MRidvnoEv1uvjp8LEPh/Hcd2+qIwjjnPT27Nw9Cp1Qzw1jZ6tRt+?=
 =?us-ascii?Q?kIzwbR2liGcKpHUCi5nervEVH5hcnJ25owsjSKLiNVP1FLU6xElu5oHmT+To?=
 =?us-ascii?Q?R8JSW0tCa4HC89Nm1seQGPt9BEgnchRkNNOAaIay3UIY9JXEgnksIprFozaM?=
 =?us-ascii?Q?jh9HNQj74S+jPgPZ9+QpJuR1/RsK4+/v2EyKEN9fFJ4SQfXqI6c0SEzlX8mv?=
 =?us-ascii?Q?Lx9xXRO0R9gLu/HH30OrHaFp9vpGXN2nYHiVTl6bTnbYBnDLA0PGlAgfCzH1?=
 =?us-ascii?Q?5o4Pr79jqvsSaRN+Awcyzibanc5Cu/lMSI1R5u+X+xEDooqxWGGCAAalKRCo?=
 =?us-ascii?Q?xsnla9dq2yozm4U8gmJkjlye4Z6wRRSJT3kSOX5/0HRpLpI8I4av6SLHteeU?=
 =?us-ascii?Q?c4TpSxx9tkHMaGUuXlVEGjYWN6mF4mpnJFM1qN6EoaVZ0bdc+wuZ88qnAdFl?=
 =?us-ascii?Q?XkfzRcDPwn2gp4KfhCCCcRbrkKiDEoww+KMUcjB6CSN/hzJOu/8+Uu0/9sK/?=
 =?us-ascii?Q?cGkCVbRTMO3fkwCU7pPpUPG1OWpbsLRFGgtY/CFlZ2q0pfV4SCB3ACo9QFu2?=
 =?us-ascii?Q?KAcTmg0QnGpaB1pFGbfag4xy1ETYTl3ieWkW4Ma7jEdQQontPtNM1lsaaSof?=
 =?us-ascii?Q?oYUUEx4ZDUiOtkpkUazgEVmundZuIUFwY8gTnNLwb4MPbN820FI24G6LSU9F?=
 =?us-ascii?Q?jrgky8pIMvk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ddOAIXZsYTkKKU70NHhYUgfevxB4oytzeEW2bVRjUBfPQt8AcHddJW6iANz/?=
 =?us-ascii?Q?yfQ1VLNe8MqDxtMKErE4Tro6TWiXpjoPHA0bYfWJfCcpntLWk753+mo3ssIj?=
 =?us-ascii?Q?qD/MjmUdT+lrrTg8Yqow1piumtn2sUz6VAOjuohLAF+Lzp66prGDLWIHwpEn?=
 =?us-ascii?Q?v8lmq12wRO1DhGKzlQp6F0+XpFG6MIRRL833QP4Uy7jtJDB7oLuKep+1BXOz?=
 =?us-ascii?Q?pKUr8xQa8URWwYx/ThktJpHRaVspwdz0+Igg7dfb9PgaftEJguRb77XjG8tQ?=
 =?us-ascii?Q?esljaSsCwVEXKsnNzh+SSsSYySU0yTAod3LP8tNAe8Tkrf/fJ6bDTgW6Fl1K?=
 =?us-ascii?Q?/oh7IvkGC/Jt36SmYCmY4Sb3SH3ay2I8jbfKbWM80EBe/JHq7RCYbjl+mcBf?=
 =?us-ascii?Q?7Xhh3YzQLCmcm2MRLqsq+EzF4p0tP1onHiQwAkD1UkE5ZZv9i2wFAkOT/oNy?=
 =?us-ascii?Q?mAn/hCz4hHOYEHSynJ/HAaydAYjiEnvNguYIf9Utrhi6BLBzTiW8KTLbBhHl?=
 =?us-ascii?Q?EBnHZ7yJHdPLpiPxKzpX+HD83ubXcOdXRzD/YpiM/aSS0mCaQzFWQG7sqjJN?=
 =?us-ascii?Q?g+RTbT+F1pRWwibOZGzgLKDK+rtTYyF26hmKZLASDij7exaoyFv0YFe5A9TY?=
 =?us-ascii?Q?+I8ZgEPld0U2pI1B6zYSYQ3kvXf5bF6c6m5jwgowDkivPyNhLW7vMQqkYVXj?=
 =?us-ascii?Q?lwJ3zaSgJhmE8LoPBfcH1ApP1ArmYiVkvCD5neo553XyP7+15jMS2/coYbOd?=
 =?us-ascii?Q?J3cO8ZAQAGEbX4I/oieaC2k//7DIBv9cUyIYg6SP7wQmya87KmOJI86yIp5C?=
 =?us-ascii?Q?NCbR1rfmusPJ5Yr/q4I++Ox9huO20YVvuOYABHMI1sETqYcUnxBRbG6c//La?=
 =?us-ascii?Q?P11x+85egMP5FAK3yIWnUDXg4My2X1XKJbiEKUigLZbVgmQaY4peT0J1ZmcL?=
 =?us-ascii?Q?OKKimPn41LOMB+e/uaHbQlwPIyxM/d3jVFsbx7ck0E8OtmkiLx8E+9Ez9gdg?=
 =?us-ascii?Q?Bos3Na/D/yWFoJZ/AmDde1fnyilsKRebMxJu2JlpnSv7/TMU9btoSKQToaLQ?=
 =?us-ascii?Q?XRV1GdZQV7TUQPQufPkgzcVyHTo5XbMlulSwP56KDuUpPspeMX2MP6q4l+/z?=
 =?us-ascii?Q?MLAkJhsIVvIIEWKQM3VaqBcqYyiH7OLeX0RSbfYPOj1C8Q6g0ozRZ9/mW6i/?=
 =?us-ascii?Q?eYdY3JEVuZ+wh5ariJ37IETektE8a62ASFBzjgFD0pthNGHCzeOH+2kZBM16?=
 =?us-ascii?Q?gboWbIAvW1ultnNT/z3IuKpmPz61soYhBFYygslqOERitG0KkVwQ2QUCy1V7?=
 =?us-ascii?Q?gXiGLfXnzu80XS1vNuZ2w7/kKCA/tV13tV6upjxSnEbeTENBBIoqgM8opW5P?=
 =?us-ascii?Q?6UJB+Fppm0/cowGiT101KM6nRtvRc0vfcQ+9VGP6l8uiTqDkrGEjNM+1NVEs?=
 =?us-ascii?Q?NIbu57cdk2b8suPFrjIf8ONdDCJhQd0NbILwsWbugMRP6YApvRRC4e/qvYht?=
 =?us-ascii?Q?0QdVL9He4V/sci0WPQhohSBBEV+/WnmVh8l9FovwOHkmgTPQm1i0vl74jfly?=
 =?us-ascii?Q?iKojpzB7XuCPvxN2wjMyBiOyuDQHm1Zy+eyc88icyyoe7WTu9LWn/fqd3xu4?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ME16gOFmp8a2vMds8BDGQGlvWxtY/ncQoiTpo2PO3mF1YPSUl2zrtKrgkUfoH+svb8oWWXy7oU8T0e0V3+OmBuaZ9kcV1FWSAXn7M52Q2243Bl9cJYCfhcdjuO4+42w343nUazgID+ekBzqogGblUON3hnSmqj031bqV3/Qbhoc93MnQc1JRupgyaZXNZmCL9fih6V5JpK9aYXTrvBNbY96J4gqHYbWeWe6RbC20DgDQdGWPpGpu34pDlCmv+CmlMge4T89PLO/VIg//lVIvnZTSXsqzfr3e5hjC+1Sx8/YWQ+dQgF2wzR+1z+3d905WUJ8i/qW7w67onE0d7MP7IUgzOd0R0rkTv0HbPd9CSEWUSnBc1USPtxnxAlIideUbniYErSlwvU3BN71ZALjAx1GXhzRs6JYPJYHF0vazk0z6YTdU98Xe9UblcS4WXWVc1hodcDx+kcF6x6w05PJSN6xBvCdm7mHdpO9TebZJJQ5uaVQc0BQLFyt6g9hkRFqybFomFa8L8sLnpWbznYqFj3ChqYk1RDGS29BBHJ6U16F3tvSucKR0Nl4ZIyRKlDAHT7lMtjMbxOy1gJCmua2dMv4WsvhppBlj3PSYq2D8qZE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9554f321-fa30-4aea-e16d-08ddc91d8201
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 12:44:33.0242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WeXFEggMXnX0Ge1Gnl/T06d1+FAH7tQV3o7oG1bKgZmMRq02pcFlgJK1KLkSGSwqB4osikDQ9qccNAlg5175Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4327
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507220105
X-Proofpoint-ORIG-GUID: hWdxUKW8uhWbZxF0nn0mDTS_WUtL5yji
X-Authority-Analysis: v=2.4 cv=YY+95xRf c=1 sm=1 tr=0 ts=687f87b4 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=ttqUlfu53Zy3l2AAJ6wA:9 a=bQS9OzEy0soA:10 cc=ntf awl=host:12062
X-Proofpoint-GUID: hWdxUKW8uhWbZxF0nn0mDTS_WUtL5yji
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEwNCBTYWx0ZWRfX/wcEFJTrp/2M
 MeCSIzY4m3luLkgPd4+J7UsgKZuK2aK/siJ5eRoXQY0gpc0+KFThwTqjQ4a4o0ck8CEe5aL3TPS
 vjustEZQq/yYqBr2L4a3TDjeOBZM46LpN9lgsk3cg1HCWQu3S8nQJk4CGjl4c9xZZCVcEDPhseP
 xyjQo4MUPkngQa/C5GOj2HRH38gHsoG8l+/842IHgMXsVxRy0cWxIAR5h9funx1142gOWTYseHy
 InFfSNDHK/JBuLuoqAu1B44aEiL8/WjWCkwdPP7b0q/EBuOVDzAtTfzjRPHfnP9Qkf3wpxD8rI1
 0x6tw0kSOI178DXsmEq60B1xihRqAqkAn/dRQ34IxL0oURz3IoH6tHWZzxt2wXoX15+rHOv0Mcd
 Vz8V/TIfWGM0TB1hEGPFfJcCbeOSAXskgjCNPYuoa/Jm7N9LzimlXM6tQjoMrWRh+VCxg7Eo

On 25 Jun 2025, eugene loh said:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
