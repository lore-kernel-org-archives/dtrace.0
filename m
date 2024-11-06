Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F741D5ADE
	for <dtrace@lists.linux.dev>; Wed,  6 Nov 2024 11:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730892616; cv=fail; b=fCupf9e7Jm9TFTaFNwSh2P+gsvONHLEKN5EJia9jdgMmbZjQ/t3CMcV6Y+lZKJOsLed/5WdJ3Ut9wX/XPOLuQVhx2hAK5RPPErmadR4XRrmryJZ/GVFeHVrgdTkrt00EBCBvoWj9HXFvdgY5hQVgDWYDVkjyroE1sQ9Fvapo2hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730892616; c=relaxed/simple;
	bh=kO9hV/zHy69yZVzPRIKszY+tsUyJLrOh6ikSA4eddS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DzSIv5XcHsZK/pUkuGGfSi/lSrTKGKhkFN+a3+DS6UnxUFq3jeLIZOnBXRo2TR2Aq5Di1/oIHNqnjSmn792PJ8qwov9kRbnYz9VW4NrUwIiY7/e64kl0oSp3W7jcVJx4WtBqVxyMiV+GZqsk9n5IoNsXeTxRwjYhCND7Ov8827Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=U3wx54eh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=G6mrsn7D; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="U3wx54eh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="G6mrsn7D"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A69BfqG014857
	for <dtrace@lists.linux.dev>; Wed, 6 Nov 2024 11:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=WqThyDsc+QWpITc3Mo9SKJgyfReIBTBPQIQiMAVhmz0=; b=
	U3wx54ehQ7mmZzaZXbvK1j8Wo3IVdw9Nhkw6qjqwl4PQxWg0WR4nktbbjPy6aW5+
	LBqXR1cS9j85ZuL00JrbIEqfSBvhnUdOcdCHEyT0j7AUIaZTde3PmlzoHjfWqx3t
	C4+FI9wSMGW+oOjEjq/oLCbl+ei9n2PBoL8oWm4WOgEd2VRZUCB7Ejukx/WtBZMs
	E3sWJZ/VNbYGnI0UdRa2/yhzknYWXuw1cNH4VNK+86iMbzbsE8wRd5530i7CTqIc
	lWDPB4du0I/coThRRl5lj+L2BgGWS+ebnDQskcfVG9BxEs+MuW/PmS/UZgdEFCPI
	/Wy5shJqZbpCnO6Rn3A5vA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nagc7kbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Nov 2024 11:30:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6AfbhD008682
	for <dtrace@lists.linux.dev>; Wed, 6 Nov 2024 11:30:13 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42nah8dtjg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Nov 2024 11:30:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kz0y8UK08XwFTo6VKRnx5i7eF1G2Y2QsSWVmxcDDLAf/gw9eHN6+8XiMWgm3hlTjXCSWKufFUTA2OjwQhmSwxlvt5RYjyn0HdyJotB1vQQhJT67wcdlfJ2hvSMb+7IdUobHf41qhcR2rfEQATzJzOhz1RwUC57GCyp93m2a6+r4Kk1DrYmftbEUNnlHg514n2koKBqDW6OZLJsVkGogC0uKXCF3D79H7DvjhPFViR0sbz/eQXLeqheleT7zA3LPkdARGOoarAS1NkwH0cTR3XGm/2uKsncLQDACYlnYFxwOf7i07FoTnink3awMlt7Umdqc/g8zmD+41kA/KfQfDfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqThyDsc+QWpITc3Mo9SKJgyfReIBTBPQIQiMAVhmz0=;
 b=dtBWx3l7v2ZbdDPYoRCnffVwIHZmSyFlLPz0uspqgLbL1fTNXdO6sPyKD7EJbHtIZu257g+y2lU6m4Gc+nEjjoJ+ciNyMYtVFzLE8kKVaskmyAaylL9sH5xsL0wb/CVWQkSjE5BzpM9Ek7ZLWoArSq+qJtfkNiGZ6HYmwNbIP5EoOtaCm8NOCihLwUNiL5o/O/YTe37yte0Byy9rItNwgwEj3qvT2JgJEiElGRYoqDYsDYaQhRmamT1M6dwIghwEHhqUla9o8LRwyrBgV5/LI2/uIDVnq0OELFGdMwWEGVN+8LNLOM/5DRkh5MnXbAifsz3NzhGlsHJYb1gsjiUhZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqThyDsc+QWpITc3Mo9SKJgyfReIBTBPQIQiMAVhmz0=;
 b=G6mrsn7DiJHVBUi1bKjlA3XUdizvzRxGNRcZgc8rsaAeBVvv4kBEBMsl4RJiicCmIqGsEBqSzwvMZi+DjQZCvv92Bk4526MoshyqyH3hdFz7XQBNnfiDrx60mkBE6sMMWVR95kNi2iKn+S2JUdjUKFXcZHtq8xdIZ596mVmOjho=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by MW4PR10MB5837.namprd10.prod.outlook.com (2603:10b6:303:18d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 11:30:10 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Wed, 6 Nov 2024
 11:30:10 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH v7 6/6] usdt: fix create_underlying error path
Date: Wed,  6 Nov 2024 11:29:42 +0000
Message-ID: <20241106112942.264351-7-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241106112942.264351-1-nick.alcock@oracle.com>
References: <20241106112942.264351-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0182.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::7) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|MW4PR10MB5837:EE_
X-MS-Office365-Filtering-Correlation-Id: 6abff0ad-4d5f-44b7-a5f7-08dcfe565f5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MdsAiJSlZGVRMlUZO8nqIp0d35p/n0nNb44itEB5N1wQREVtoN/Vvl9e/rQO?=
 =?us-ascii?Q?RX4Y5+Ctm8Ii7omD8+9+f9G7tZYRzo/Z8v5TNOtYmZyJuldnqA9bHlg8fJA6?=
 =?us-ascii?Q?ceRPbi/49SmsLQWVQzgRLlfJ0SzhWyOwH6F7p85ATqXdsm+61mxvBx2YQxPq?=
 =?us-ascii?Q?TcomymvesNpy6UtAQeOWCVobC24ba+wHeQx1qD0K6eXaR2zL3ISAexVi5SpV?=
 =?us-ascii?Q?RAbjXdiYxfsMnlOTLVocb2Eq76E6nIeky0DULlVCzUQ1EJM29FwaSNuMN3T6?=
 =?us-ascii?Q?6VlkFqisUfrJzqT4ZQ2Nq+N/x/arAqy5iXy7mcFJk+N94kotd7MUe79/XmG/?=
 =?us-ascii?Q?ib2jo5f/oqgHED4DO0fHvEyDzzCoImi5beumXORb+GGHFtCsMIlrjjj3Cp2O?=
 =?us-ascii?Q?vNcl5zyKk/9NiRj2LwK2ePHgvvYCkyxVJ2dKyI/EHRiiMUdt+xye+V6nvJlY?=
 =?us-ascii?Q?hP+OfDgjVaWFDaPmDjB/YLMIVb1ZBj6BQIeDi5niJ8B0F0Ysxv50eTIHSq3+?=
 =?us-ascii?Q?Hlvs80CZ+Q45sd64d6jDdwDv+VomqEH0V4OLKpvgHKjgpi1hMmiryOz3Hq2P?=
 =?us-ascii?Q?BP5lKTeTvHcib2YW5KNJOD5dJZrWRwkeLkjsLWnDAcfu78gCGyyt5c8scPBz?=
 =?us-ascii?Q?/n7L/vXQkAd6M07kwZlssJoH2tWyazNncqiGG9BlLRyurszVXSxP6jKPh8S9?=
 =?us-ascii?Q?XvBa4M8izUPFjCBMmOT2o6zJjJgvto5WvCYS0PBza7aRRhLUg03XoPgKHliI?=
 =?us-ascii?Q?q2nzQWj5esFH4PeK+TWVVq07i8F8b1PrkZJbVKjrY0hURPdD4Tw+xG1uMZfT?=
 =?us-ascii?Q?PxflovedYrqtYxYwW8L99q2EQ/yDz1KdCvQxHB4KVNf99zS8xNIADCqsS/cG?=
 =?us-ascii?Q?57P2BC1FGJp/HF1lT/L0CBX1f43RbFwA/Sf+xnrm4tYNl+rv6v1AU6q0+JiJ?=
 =?us-ascii?Q?VNtsZcsQDkvvAD2V2YmetHg96q/r6W6CYXgqVFgFCQTf6qVUHgNB0cyruE/O?=
 =?us-ascii?Q?uIQkMyZByjxRUKsC2DyZ577LOnWk7VZenfDLdJ2evpAWEGFgnyBidc4eQvYE?=
 =?us-ascii?Q?1nJFyplsW2yI3PX6ZGs36KqdRStzl8w2QChTdqNnUd3ws66cW0iE3BExLtAN?=
 =?us-ascii?Q?GmEpGJFB5EbOQv9yg4KhlQk7IZ25SWBgpXdk7iOHIwoZ19wrora3UTh8c3Jo?=
 =?us-ascii?Q?ty5LXAfZkYzEFf/JCUzOLGlMU8kRApRTlym99StuBn4mGH5totfWfkncn2Wr?=
 =?us-ascii?Q?84GKjib5C0+JCh5qM6Bi80eBs+sIe9SHARUPGo2x01jEVoi0FAPXGBKYpChp?=
 =?us-ascii?Q?OtPIgqs73XEE2s5wA/cbtp9d?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zWdOQJwaR4iyXR9D9MUjkQekI2nsmwrK6AtvzGPOPjMnhs0ETH5vw0aWaW0N?=
 =?us-ascii?Q?X867BRWHqbArAtG2IIP7uS4g/YK6eCzOOjnEoG5/VqJuWVlbHHb15TXryw2R?=
 =?us-ascii?Q?fdwfW/1Zo7X1ds0cJqs8mGCZuCbG7BXxQHgPpFAjMW7EkfkAFyqnEvTVVymj?=
 =?us-ascii?Q?Hn0xZzHNsjMV2csyR+VeaD9+CK7U/z9Ct2QSe1JrEPVxKWQKjbCuhFMaqVoF?=
 =?us-ascii?Q?NikinwNpnBUwTZyZeVG9rdlEdDvSzqG7D43s/VFCJyh5oQMMO0c5HWyKVNHl?=
 =?us-ascii?Q?C4uBbaoVJgqdgvGdKszjXI2E+9vS0R5gxYI9Xa6Cp973yTNsiu2n18L/QUbx?=
 =?us-ascii?Q?+J9aeIXHap7A1HsFjtVcOT4UR0kzZanyP6uT95ce/yOEGJl4baj91VbPE8ZS?=
 =?us-ascii?Q?0fTQ9m+rHJ58bE6OFhuAzcDX318wBxRL8owZhYx9kU2wijmPm+KuFGdImccd?=
 =?us-ascii?Q?HyFVhlINsnlotlfLCzt2soF06xF42PYaWyIHfm50laLd/eApMO4OoNl4M55M?=
 =?us-ascii?Q?KJeqxC4XH34UgVuBfWkSWEVQLFODnohkZWQ5YfPQCXZP0WICXr0+5+a7F1ma?=
 =?us-ascii?Q?jhQd0s3PJfsDozIHUtxhoHZYfcngJzklmuiX5bfJ5km8lFtRHh9+qvfyHtYr?=
 =?us-ascii?Q?pOjKGJICkm2hmBQCNfX0ekl21zg6FiAKvgxWwML52+Kt4sw7lestKP4QFGp9?=
 =?us-ascii?Q?Pn5TgiwL+QYpZzJZs8gzlmi6XJzSbX2zwpWEFcAY74aWJmWHkZi6vca+1dAu?=
 =?us-ascii?Q?t346USJIu7G0oPI40QSy/41C13MS5degP5VWMuPlGo/wUTZXHknAzS9gw4BE?=
 =?us-ascii?Q?ya0lwyj9LRVLFqcxyCBw1X/p9yRtsVmZJsrfwPS1CkjSo6+vtF3c8zAI3ju0?=
 =?us-ascii?Q?hp2XVYpQJK1KQyWP4uNvU7kfhVjvOfJdsatYHTM31WbfApylQfQTnAfY6GW4?=
 =?us-ascii?Q?MrLNnpdn4M314J7GTcsLVxx8+/zPSKmcF/pYvkgD3Q7xKs1C+IzKeDSlF9nh?=
 =?us-ascii?Q?0lQdNzaamnz2zETTO5zWUDlLAP1zB9QF2HZkh9hjWUoa8IzfmAMvK6z4x3WP?=
 =?us-ascii?Q?tsVpSxFpxHZGud5MOSRMuq08uZJ1FeWozpWHoAERKdxTxF/NteP5B1UN8eCT?=
 =?us-ascii?Q?HOSCXEV2HtqfgGz4LxGhyIGJPRAtu+AaIEWJb+C4qo8Qm7thm86hOpgbjxob?=
 =?us-ascii?Q?D/DP49I/ceoYGVmsgiuxdhwqmi1cZdZxvXVQfySMQPYa0P7bjolSL1/3FzvY?=
 =?us-ascii?Q?4gSFB4FB/ViZ8z+lrt1k529thrvWhjcqkozaQeJ3vvjFryPFTke+DYxLGupa?=
 =?us-ascii?Q?CXXjPOwMzmuDgu+8re7pBIW9OJdwf8ukFHo8JmMsaOMTq3OYQRMKKrQTsx7D?=
 =?us-ascii?Q?yfGP6mEh/1mRVIwVxiS4uudxvEbDsHMVhVUVjANu1nEaj3D8ru4ISvw+aXLT?=
 =?us-ascii?Q?2NbwLLVEE/feqZif5FpIbaZIH0NIcQ1e9Khs435rR1ed9DwwatNqFfnDQXAm?=
 =?us-ascii?Q?DlCVpNctFuRw/RZr3ZnZnAC1OiXlFjg/u4QUc00v4/HrjVpQYpJNidqG9/jn?=
 =?us-ascii?Q?cwABmzGOKzQ/6T/LvuTqIODulkMDcZvwh5CwDxHhDfdLG2JcEHOYTAvOi4qL?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	csJVmksp6eccMQVsBocMJt6fr/miEQHPAE7Fn5mL6C3Loq5/NQne29tnH3a9hxBIjMnrwRs/wWmwguzePUwDbVEM+XIX9ENJdUXwgR0yLoadxG0XERAtLCud/9Hh7wtaQSWisDJZBIv/0GBWD8axSXiR3fkxs2Xf1sCFV33mHk9AXJDHUtWHNAs2RbiXyL1+qM+++Dvvs9QC6seBNZNg7WeHz5LwHIcg2sw+u6MWWv/X0qkeDjUCe4y9u6yqEcR9HQxklrEN72e8gPoEqbtv7HJWzQCZ3dCEtnQSdMIF6JkuViWFHJP3CK9Q9E69qdquRSZ9XIm9y/6gQWtguVhMwJNoydJDFDB0qAs4jV1SehjclSClWuxz6NxEXJ+KJjYQWYQOuFfNykOpa6U4yJlWSdbl/Q3jgjqjljUKpvry0K2328mGgyzQrjEgGecx6LXxqrz8MNwg83OBEtmfRoF1yXG59AALkX1ApTo8J0cdXX9tu5rRP7sCyf6OWQ6Wt9Eaiq53b0Dz8aTrRbnzL4qY8lFOZYVL60Rbm1NlHEJqZseV3wc9kzgDLvmQ1kBqVji6G1Vl5j8X2vqa13j5K8Pmi7vXpvMqQi75gb1wZDjPOn8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6abff0ad-4d5f-44b7-a5f7-08dcfe565f5c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 11:30:10.1070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3hu08iUL2c8UT2B8QfMdYa9QcKoYcxU69ObmJ2PmQtQNZ9M6tdxj9QmRxoAy/hzp4oJODDoVStOdIoUB/G+BEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5837
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-06_05,2024-11-06_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411060094
X-Proofpoint-ORIG-GUID: Ko_oP1amb04V-31nzIxhtUsHRmp53U7x
X-Proofpoint-GUID: Ko_oP1amb04V-31nzIxhtUsHRmp53U7x

On error, we were destroying the underlying probe using the wrong call,
as if it were an overlying probe.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 1a1500c03ecc..205014617586 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -714,7 +714,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 fail:
 	dt_dprintf("Failed to instantiate %s:%s:%s:%s\n", psp->pps_prv,
 		   psp->pps_mod, psp->pps_fn, psp->pps_prb);
-	probe_destroy(dtp, upp);
+	probe_destroy_underlying(dtp, upp);
 	return NULL;
 }
 
-- 
2.46.0.278.g36e3a12567

