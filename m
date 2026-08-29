Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DB419CD0A
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 13:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788011603; cv=fail; b=KlHkOXxuaoiY8wJA9l91ugVhatmUWfU5NHvFttLV83sm8t203GL+B0AL26jFDmXwNQ0bZ/Rx+3nBPlUjZgP6uUob2+p0eJMsW/76i+Bm9GxFsOirTnXUYV7yj5PhT9j6xS2RrH5Ebt2+xz+axmKZVSprJ4dKTWU62E8B7kARNQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788011603; c=relaxed/simple;
	bh=zblp/JwJrQUWBzGQIaCTDlmo2t2q3LAbLCEuqLoJQ1k=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=nu8pzAzXIMXQg2KAB825dSTgTsSx1GnZuI8CfgRCMCYf5nl1cqwx3M3ypqlA+tLs99BRIZUm0ehlLofpc83p8CBZ4ypE1iAxUlPkONAqo+ru/OOJQxcuhaJFbRcgu9IA0PkYfkWSMoPSr6TjPOVk6de+nJ/RZGnRzuSkEEjj9uM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MNh+A09w; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KiG8eiu7; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MNh+A09w";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KiG8eiu7"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TAx3wo1245055
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 13:53:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=uDSfIrzBcc4LXk9Da3vaa3c5899T4C++mXuJCRaDPb0=; b=
	MNh+A09wrnQz/5GimkLhBYN4UmXvd8wSHyTV8k1Rm1hw4oh1aWA0OECn/CviB0VD
	AXUkGF+y1Wle+E8p1wrTUb4+191XGLLIn9zUbIf41h6egkRnrabWs1pFrJi9sgdI
	/JkPr/OaUZ+0rjXK3VX+j2g591P1UiuSVoArO7T5B5/IFJ7LdBBZ2/2aFLgyQE8G
	4BifPmdcDxIN324QS1xQMNfz1yMrrQ9kDUMYha1YUeiwrfU+u53X0l3ntAXlnsmZ
	aTKpJK8iuyl/RHZrM0QGGahflYnpHja0IQwW8s26YM6brokYaq2oLeGO9NBhufLK
	mAodRonjLbsm6zNN1M7Rsw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gbpbare28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 13:53:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67TDoVw4016777
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 13:53:19 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013069.outbound.protection.outlook.com [40.93.196.69])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4gbnvbjemu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 13:53:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DwIq/HayIV48oXAJR8bppY4YB9hwrrqpAAh2nXbVbfb230NX4q2eApiGkD/e0f7olVKmUUKVAkuSW9gjNcitLxaLbQgRN5pgq8HjEUe69Wx+fq5o5ylPeicLIoIWiWOqz3pmaUhcVynHoc25d8O8EgkKEvDVPSOsnIo2iIUJO1VDmPXnesSObQSXRzeuXBngCxEYrczOK5q0+2fX/URPT2MYv4xgrgZ/9ewrpbhltJxF2QHlHZFgthgkVIXKCvbchDPc2sy7Lt56vQmWDGTZ0a0fGi6C/55zenBzmuj3gbwwn+gdXcWpVGUJ1RDu6J8wfebuco1QuuSKQ8wVtwxlnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDSfIrzBcc4LXk9Da3vaa3c5899T4C++mXuJCRaDPb0=;
 b=sLdotUEtJ+YSjr1ITp735cgQxP36Sn42Xgib916zRxicUnLLRPWrW5XiRtu8/+OO+2Ub3ovkg2M+iIMh1RQf8Iv3ZLuIHdcIm9Mg5SGsJd0qa0n02lxtlMKvI8g/RWAmsyl7Da48DETm4kxEKIqchAOGxVSEWxweZEqm8xz+w4xGiSBXuDVNWBWHTbaziTjrmVWOf8xm+/Fph1XoRpF6lsiKzTBVQXtvWSnK+4GGZsXVFYf7biM7Nm6kEi1TGSin/WIZ9cZWV6l2i/R/Fon03TZlA8HjG5eYEpiv4VgY0S5nzhlMVm1Y66hRbtxZuLW5g3ph0UN3KDaxfNhMQtFlPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDSfIrzBcc4LXk9Da3vaa3c5899T4C++mXuJCRaDPb0=;
 b=KiG8eiu7V691ADRsY6kI6Zd60s0ctqFvir65+pYZa8aXqcuavWhczvgRdxfImoDUhalWvyRldjCZyAULp2wUJlO7NeNT1A14D3+NaU8cBbglxDZsfqAOGIq5v5/JIMpNmc3xRgR8X8pB0A1EcOMn5eMdK/zbp9wfYHCPwPZh+qo=
Received: from SN6PR10MB2478.namprd10.prod.outlook.com (2603:10b6:805:46::26)
 by CH0PR10MB7411.namprd10.prod.outlook.com (2603:10b6:610:187::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.9; Sat, 29 Aug
 2026 13:53:13 +0000
Received: from SN6PR10MB2478.namprd10.prod.outlook.com
 ([fe80::c48d:b954:4581:97d5]) by SN6PR10MB2478.namprd10.prod.outlook.com
 ([fe80::c48d:b954:4581:97d5%4]) with mapi id 15.21.0382.007; Sat, 29 Aug 2026
 13:53:12 +0000
Date: Sat, 29 Aug 2026 13:52:16 +0000
Message-ID: <10554a491a4523d4a81b676828508d1e@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/2] Add packaging configuration for Debian
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0061.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::25) To SN6PR10MB2478.namprd10.prod.outlook.com
 (2603:10b6:805:46::26)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB2478:EE_|CH0PR10MB7411:EE_
X-MS-Office365-Filtering-Correlation-Id: 07585fd7-3430-4f5d-8863-08df05d4ddbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|10067099003|5023799004|56012099006|18002099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	jUPoTJn5UEwCBkvUl9eg07DX0TPNXGgyjlqaDHsS5f4dMYAtDt08o5dtbF5zkYwszZ5vreqzClvKp/NrMT7IYfvBPLrfrgueA6AJfV2UZEhdAbeqvX9d5TWJhwQ+8p0Hu15Q7WHLdiZEXfgVgXj5vGOC7iIKawbDGSiilQn7B6is/ul0QRvLYy4Hrq05luxxfWqBSTKErmv2orB18iG8vOcu/ATrHlXobpgoQfnZqic6hVCLZHWpmR2w5MtBe00l1007AaQbpwy2j4p+BE5qK8VY+X5QR6z1jmAj43W+/aneCr49kNWkE1y4/cIkWgceM+vfZMRs5I3X9VEATR+5wwaTV6N9pUVF1a0e0/J9RI89phWdDoO2OX4dRwMKPhWZtca7HxlSHS3WCkr5fNhN95w4NwvFZVQO38jGjPb7FRGrn2tQInbLxWbLMKmZUvs4xaRP+alZQAlkyyGoht9OrlBXd81K3Gg646KPH7Krqu+BPNn1AXQ0+vfhKVht/7wu+ueCytvz2tFgdSbt6ajRb8soLOeMwJ+Z7W+K5tOQb1q5mEEXRyDm2maWwYX5JDCZFkZXpDIahyGOSp7Yu+eabmsIhZ+Cj9g2ZWo5SvMtTpPXWgWxOgpJfGGGVqt/zTB9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB2478.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(5023799004)(56012099006)(18002099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EVOO7DKzxlaaBf6NZu4kMFnjzgLkpwtaL4NlMoUm5WaRKrqBKKpreejNcT4R?=
 =?us-ascii?Q?khqE6eK6pDjzVfncxYGZUwIqFOw0A6Uo5VGk7HPHFWDV3nrZWDZ6ipML6ULG?=
 =?us-ascii?Q?OfXn76WTr+Xf7VduYySbcTDRkZq/8wu1y3PtSeGXpMeG6BFueKvCPTlq3CC5?=
 =?us-ascii?Q?xXm3YKoxcF6Zmjq8hftaPYS7SIK8o5IpxEdkpeasW5FXfpRc48L2KQcSrVlV?=
 =?us-ascii?Q?6zsRcqWzP13xVzzyYnepFpo+xtzLgZ/wKH7ug9qNC7GLOsf8LxE2c430CdAm?=
 =?us-ascii?Q?qDWSb6fLI/PrjVwRwga6DCxUcL7xvf21ACX7QMV0DO+t85AOds9+grKwmFxp?=
 =?us-ascii?Q?oqiNL5blBWe5fD//Nc1dByO1azisQhwik9xAABdeHXhRNJx4shkAWLne7evz?=
 =?us-ascii?Q?wgzsC6RbStAm74W6to9LPzC53OGn5zK/V1CkfLQXmi01l+T/de38w2FxLrd6?=
 =?us-ascii?Q?OYVmPCZ3GHrUhg/B5YPIwT9h5BmJUX+HG3NkqLznfD1J7a8ywNwywml+rZnj?=
 =?us-ascii?Q?Z/k/cG8CfJae/pscrmU+qRdefjuyK/rmY0VHXwqTeGZe8l0L+Ti8Ur4a5ylJ?=
 =?us-ascii?Q?Lp1a0XbHvIqcuzjWr+U0G7E9+uNC3FD2qY0rVVOFx4mtWO8euMbiANaWD58b?=
 =?us-ascii?Q?XmkXsKa5GzwbATTBIUPJNa7vlGnU/jF9Ff28J1gVbwZtbvJsOtQfWGTpmtlZ?=
 =?us-ascii?Q?nrsGmifU8kP8TNNr81R8+5m/Hz+EmPCLeqMDiJruihLWGw6oAOIO9U4z+D6K?=
 =?us-ascii?Q?3+QhNpy5VjIVpal9i5ZRlPKZp0J4EBZ7LdWxShpshMQg0v6j7fIORaUJdSKK?=
 =?us-ascii?Q?fISXaeiNxENPkLNa+LY8IrErNi1xMWpF4w2CcJvwBERpPKRhVmU7dAHrKuh8?=
 =?us-ascii?Q?jTnjNWXKEdKf49h/q9GWXOykjmCczEkzD3CHPVo9BlDEXFuCwjNQKXOPuTnD?=
 =?us-ascii?Q?CyidETBKXkbe7C67DWRpYuJmzwOS8lbDoJYZm68/uMX7E6EiXNj7a7kMCLv4?=
 =?us-ascii?Q?vd2hbDQWX5AbSjo/4VhALQjGJa9HaNy7/+CjP9VCTPhHCKJZprX2tfHxp4Ab?=
 =?us-ascii?Q?jDuQc2eP/bIg27K+C1vCEhEeO2AFfPDf/D2PA33X5VxqGzhGPl16LUiMCEow?=
 =?us-ascii?Q?ACkknjoKY10SmPicHf7R3BRlNfZRx1PhW2FTJzW7f0PZy1R3wWdZ/a7RYIfk?=
 =?us-ascii?Q?pMnkF9/af3+X08VkaruMMRERprUFyO9Ivi/5fdw6CY8Ku6gD9V3lIaHy/GDw?=
 =?us-ascii?Q?kKXRE8it9XEB1kUJ/wLzYoOHaP03aTp45kMRPdSQNYGQAj2+b+uErok6pZ8R?=
 =?us-ascii?Q?a80mdyL9SYSO5y+QC6Z5MSfZDlCViLJqRCTsNOSyKsz2wphAa3pg7ubx22oX?=
 =?us-ascii?Q?oNgeGYg6wE9+HAVw91OCS10nqJK3uwyaJ9eqI+lXNBf265fN3Q23+VA3ctRZ?=
 =?us-ascii?Q?UA1sO2RKFH0OqUuMEM9vgeMeSfB2ODUYbHh4/Wb3+BntcjPxir5fZ76OWntf?=
 =?us-ascii?Q?y/RE3252Lri1iyYc9bX1i1aM9KTEyE7c3y2XY21W0JmVErgyQhxhxbjXHATr?=
 =?us-ascii?Q?1XGCRI56Cu81z9rpe864iu6RdFSxaKNlzgpW1g0kPBTXVphJAlgPQr46WD48?=
 =?us-ascii?Q?CGd9fNtrIOqQd8rJy/hFRU9oI/7DVOu26IX2hhriiWBbyiSggjTpL/vsVhDn?=
 =?us-ascii?Q?p7WwwtV+1frm9bdPJYV2bNyoQ/kInSYQwLg7Edg5FWZSp5/YSqFPQ9aWPvPx?=
 =?us-ascii?Q?fxbfYV1qYkxf6iPlGsCdxPydsj0hYtE=3D?=
X-Exchange-RoutingPolicyChecked:
	eZJGRzf97lHW4UQrigr5scoYnbJBFxPe34ZAQ3iqkzI5ks9oqDI5vrBBROFenz1wKvMSFsOdlYCMkQMM5fWAX2pQ68MTbo/8XrGW4siJziC/CrR8XHBcKvqslbCxSEdvHczaNi+81szv711oPGoO3Liapu31AxN8gVhFwWc1oAJj0b4Ile24dkWis1ZX6u8tNAmCUWBQPE31ua0/XXuUz0LKJIO7oBKS0xjCc99SHT+j/mpXtjkIMeA1oQMoThPykUHBF9L4Trfx2jclZGEK+vzcxaSEAYGSMsNzds7/ibYcQRoDT8O5pYnmkCe95sxqkE/i7vh1NQX9oiz3o9ptAA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	H0o70tnmazUdla0Dggmiv52aC4Vl79X1Z9dZvpscq9SK+4ClnfmA5Y1BrAfWm82vY3pKg2rlkzFHSr5lfymiHV3gBZl9d4EKbFa1q/6E5CSl7VEIxKnkCPXNSqu1kePFJM4j/AqhNvk6cdgPgDKbA0wKOOwjBDBNvTBjWFe/CETMkxlqbP8LCIjhy6ay5Hp+hqwof0uxc0CMs1mXgV9czQH+XasHjQBtOoacOg6SLeqXxUOWKnLa3mMb84vMnigv5TtEj92wYZgsnB+3hNgbNB7U4ruTMLhgq09aPlCmn1ihZ0d0U/D8+1qK5fvJtWeghbhg8yN0mgKIxZfoPjoLyGpVSfCK9BcI4OcqFlTKQe9pyoGmjJf8Qr8c7yuJoarUIiD9usbGebsa2jw3C05aRpZYgEuM/wfb61T2SkiAxWVaGuDNdZii4cL71dZwwbSofZMWfAyXGa+RYv5Cv3TCd8ue7xCWLrcWxqSjZwrbTC9fv1LebSbCpBjuFsVcYRJNbpQtzhXym1xS7FJfnQY+Q9tffzbJdjQlQeuFlVvcocNVHUg9KrT/CNkowqVz1/MCttj42JYAVrVy7XsVz5jQA1rLSRVjGzf7ruZzI6TaC0o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07585fd7-3430-4f5d-8863-08df05d4ddbd
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2478.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 13:53:12.7837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e37xi0oE2Qhk+oTvw63zWhZ55D8yqyCa2k4PIQgVk6+JEONNkhZ6Ed2HTaamPob6AwjobFwlR8qCUh/NS+78mgeoGwNWPNBaG2LfABpXNys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7411
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608290120
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDEyMCBTYWx0ZWRfXzJzZkJjUQMVO
 h6f8gaL6+a2uj43WrJkKd33n7L2TTlqBkG4JcnR9hCyXJoy+oePBH5Kxd6g4A+vA41rRcofMDYl
 L5hWAFEwXBzUJ3aT/2TfNuWmpLtJeCkpbKJYOqGF9TpA6Fdd2g/X
X-Proofpoint-ORIG-GUID: gz-84b4Tgk6IN7P0-0OoV0NgAylFI8rx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDEyMCBTYWx0ZWRfX2LtBiHMf6c6Y
 xoSUuQ7CkUeFsctK/mTXS4pLsddq0ysQbrmzwWDw1kEUQKkw2Skax9Sm3e4z49vgV5oYvzmA/p4
 etN5d8cpdqQPobKB41zKLGfh2bNvb+7eIjj2ihuOYmnvnTSnNg2vv3q2GeeS8mlBjhFDLeg4TVY
 kf4U6NkfEw+H8BzrtvSzelEb78Se5X5B6rNvwmEW7tsslsYjaKBxbMqJfoTG1cB5jJUZFRn+DlQ
 Enc8UgBEl0bNw1RJNFH9ny0/z3Y7K1CYv53Ji69fT9/JeJG4L5AfGPgJT1Wnu5ctAmB6j6FxdJ3
 QkYSdE5C4zh0oULiTaWoViovUd9mWWTiFhGadwQBboeZXnRXJaXbZc85EJWq3nJa8YdXntYMuOj
 CVI/NC0PsfiN95TeLdLRKOEdeI/e+G+EZoIFBGm8CMEY1rdDIpgfNaYss2bEiKfWEvGkqI3Vr2i
 XqEmwQDulaiszq0qAgw==
X-Authority-Analysis: v=2.4 cv=DMi/JSNb c=1 sm=1 tr=0 ts=6a92e450 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8 a=NEAV23lmAAAA:8 a=xNf9USuDAAAA:8
 a=mDV3o1hIAAAA:8 a=pGLkceISAAAA:8 a=b7p-1omzaDGAqpQNs5IA:9 a=3ZKOabzyN94A:10
X-Proofpoint-GUID: gz-84b4Tgk6IN7P0-0OoV0NgAylFI8rx

Packaging configuration files for Debian are provided in dists/debian.

Sample steps to build DEB packages:

 - make dist
 - cp dtrace-x.y.z.tar.bz2 $D/dtrace_x.y.z.orig.tar.bz2
 - cd $D
 - tar -jxpSf dtrace_x.y.z.orig.tar.bz2
 - cd dtrace-x.y.z
 - make prep-debian
 - debuild

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dists/Build                                   |  14 ++
 dists/debian/changelog                        |  20 ++
 dists/debian/control                          |  74 ++++++++
 dists/debian/copyright                        | 149 +++++++++++++++
 dists/debian/dtrace-tests.install             |   1 +
 dists/debian/dtrace-tests.lintian-overrides   |   8 +
 dists/debian/dtrace.docs                      |   1 +
 dists/debian/dtrace.install                   |   1 +
 dists/debian/dtrace.lintian-overrides         |   1 +
 dists/debian/dtrace.manpages                  |   1 +
 dists/debian/libdtrace2-dev.install           |   5 +
 dists/debian/libdtrace2.install               |  12 ++
 dists/debian/libdtrace2.lintian-overrides     |   4 +
 dists/debian/libdtrace2.manpages              |   1 +
 dists/debian/mkChangelog                      | 174 ++++++++++++++++++
 dists/debian/patches/debian-configure.patch   |  17 ++
 .../debian/patches/debian-fix-sed-path.patch  |  12 ++
 dists/debian/patches/series                   |   3 +
 dists/debian/rules                            |  24 +++
 dists/debian/source/format                    |   1 +
 20 files changed, 523 insertions(+)
 create mode 100644 dists/Build
 create mode 100644 dists/debian/changelog
 create mode 100644 dists/debian/control
 create mode 100644 dists/debian/copyright
 create mode 100644 dists/debian/dtrace-tests.install
 create mode 100644 dists/debian/dtrace-tests.lintian-overrides
 create mode 100644 dists/debian/dtrace.docs
 create mode 100644 dists/debian/dtrace.install
 create mode 100644 dists/debian/dtrace.lintian-overrides
 create mode 100644 dists/debian/dtrace.manpages
 create mode 100644 dists/debian/libdtrace2-dev.install
 create mode 100644 dists/debian/libdtrace2.install
 create mode 100644 dists/debian/libdtrace2.lintian-overrides
 create mode 100644 dists/debian/libdtrace2.manpages
 create mode 100755 dists/debian/mkChangelog
 create mode 100644 dists/debian/patches/debian-configure.patch
 create mode 100644 dists/debian/patches/debian-fix-sed-path.patch
 create mode 100644 dists/debian/patches/series
 create mode 100755 dists/debian/rules
 create mode 100644 dists/debian/source/format

diff --git a/dists/Build b/dists/Build
new file mode 100644
index 00000000..882939c3
--- /dev/null
+++ b/dists/Build
@@ -0,0 +1,14 @@
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+dists_DIR := $(current-dir)
+
+# Prepare package building on Debian (copy ./dists/debian in ./debian.
+
+prep-debian::
+	$(call describe-target,DIST-PREP,Debian)
+	rm -rf debian
+	cp -rp $(dists_DIR)/debian .
diff --git a/dists/debian/changelog b/dists/debian/changelog
new file mode 100644
index 00000000..b176f3cd
--- /dev/null
+++ b/dists/debian/changelog
@@ -0,0 +1,20 @@
+dtrace (2.0.7-1) unstable; urgency=medium
+
+  * Fix CVE-2026-21996: divide-by-zero if section header data corruped.
+  * Fix CVE-2026-35233: OOB memory access.  (Closes: #1135619)
+
+ -- Kris Van Hees <kvanhees@gmail.com>  Tue, 12 May 2026 17:55:24 -0400
+
+dtrace (2.0.6-1) unstable; urgency=medium
+
+  * Fix CVE-2026-21991: dtprobed unsafe probe description handling.
+  * Limit building to supported architectures. (Closes: #1129637)
+  * Remove unnecessary dependency ob binutils-bpf. (Closes: #1131271)
+
+ -- Kris Van Hees <kvanhees@gmail.com>  Tue, 17 Mar 2026 17:53:17 -0400
+
+dtrace (2.0.5-1) unstable; urgency=medium
+
+  * Initial release. (Closes: #1128435)
+
+ -- Kris Van Hees <kvanhees@gmail.com>  Fri, 20 Feb 2026 00:31:21 -0500
diff --git a/dists/debian/control b/dists/debian/control
new file mode 100644
index 00000000..7560dc9a
--- /dev/null
+++ b/dists/debian/control
@@ -0,0 +1,74 @@
+Source: dtrace
+Section: utils
+Priority: optional
+Maintainer: Kris Van Hees <kvanhees@gmail.com>
+Build-Depends: debhelper-compat (= 13),
+ bison, flex, gawk, gcc-bpf (>= 14.2) , valgrind, binutils-dev (>= 2.44),
+ login.defs, libbpf-dev (>= 1.5), libc-dev (>= 2.34), libelf-dev, libfuse3-dev,
+ libpcap-dev, libpfm4-dev, libsystemd-dev, libz-dev
+Standards-Version: 4.7.4
+Homepage: https://github.com/oracle/dtrace/
+Rules-Requires-Root: no
+
+Package: dtrace
+Architecture: amd64 arm64
+Depends: ${misc:Depends}, ${shlibs:Depends}
+Description: Dynamic tracing for Linux (DTrace)
+ This is the official Linux port of the advanced tracing tool DTrace.
+ .
+ DTrace is a high-level dynamic tracing tool for Linux, built on kernel
+ tracing features (tracepoints, function probes (fentry/fexit), dynamic
+ kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
+ leveraging BPF as execution engine.  It features an integrated compiler
+ for its high-level tracing language and native support for interacting
+ with the BPF engine, significantly reducing runtime dependencies.
+
+Package: libdtrace2
+Architecture: amd64 arm64
+Depends: ${misc:Depends}, ${shlibs:Depends},
+ fuse3, libctf0, libelf1t64, libfuse3-4, libpcap0.8t64, libpfm4, libz1
+Description: Dynamic tracing for Linux (DTrace) (library)
+ This is the official Linux port of the advanced tracing tool DTrace.
+ .
+ DTrace is a high-level dynamic tracing tool for Linux, built on kernel
+ tracing features (tracepoints, function probes (fentry/fexit), dynamic
+ kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
+ leveraging BPF as execution engine.  It features an integrated compiler
+ for its high-level tracing language and native support for interacting
+ with the BPF engine, significantly reducing runtime dependencies.
+ .
+ This package contains the shared library.
+
+Package: libdtrace2-dev
+Architecture: amd64 arm64
+Depends: ${misc:Depends},
+ libdtrace2 (= ${binary:Version})
+Description: Dynamic tracing for Linux (DTrace) (development)
+ This is the official Linux port of the advanced tracing tool DTrace.
+ .
+ DTrace is a high-level dynamic tracing tool for Linux, built on kernel
+ tracing features (tracepoints, function probes (fentry/fexit), dynamic
+ kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
+ leveraging BPF as execution engine.  It features an integrated compiler
+ for its high-level tracing language and native support for interacting
+ with the BPF engine, significantly reducing runtime dependencies.
+ .
+ This package contains the development files necessary to develop
+ alternative implementations of the user interface for libdtrace, i.e.
+ replacements for dtrace(1) itself.
+
+Package: dtrace-tests
+Architecture: amd64 arm64
+Depends: ${misc:Depends}, ${shlibs:Depends}, ${perl:Depends},
+ binutils, cpp, gawk, gcc, make, pkgconf, tshark, bpftool
+Description: Dynamic tracing for Linux (DTrace) (testsuite)
+ This is the official Linux port of the advanced tracing tool DTrace.
+ .
+ DTrace is a high-level dynamic tracing tool for Linux, built on kernel
+ tracing features (tracepoints, function probes (fentry/fexit), dynamic
+ kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
+ leveraging BPF as execution engine.  It features an integrated compiler
+ for its high-level tracing language and native support for interacting
+ with the BPF engine, significantly reducing runtime dependencies.
+ .
+ This package contains the testsuite.
diff --git a/dists/debian/copyright b/dists/debian/copyright
new file mode 100644
index 00000000..5c5553b3
--- /dev/null
+++ b/dists/debian/copyright
@@ -0,0 +1,149 @@
+Format: https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/
+Upstream-Name: dtrace
+Upstream-Contact: Kris Van Hees <kris.van.hees@oracle.com>
+Source: https://github.com/oracle/dtrace/
+
+Files: *
+Copyright: Copyright (c) 2003, 2026, Oracle and/or its affiliates. All rights reserved.
+License: UPL-1.0
+
+Files: bpf/*
+Copyright: Copyright (c) 2019, 2026, Oracle and/or its affiliates.
+License: GPL-2
+
+Files: debian/*
+Copyright: Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+License: UPL-1.0
+
+Files: bpf/Build bpf/GNUmakefile
+Copyright: Copyright (c) 2003, 2026, Oracle and/or its affiliates. All rights reserved.
+License: UPL-1.0
+
+Files: include/linux/bpf.h
+Copyright: Copyright (c) 2011-2014 PLUMgrid
+License: GPL-2 with Linux-syscall-note exception
+
+Files: include/linux/btf.h
+Copyright: Copyright (c) 2018 Facebook
+License: GPL-2 with Linux-syscall-note exception
+
+Files: include/sys/auxv.h include/sys/bitmap.h
+Copyright: Copyright (c) 1984, 1986, 1987, 1988, 1989 AT&T
+License: UPL-1.0
+
+Files: include/sys/glibc_internal_link.h
+Copyright: Copyright disclaimed (all content required for interoperability)
+License: LGPL-2.1+
+
+Files: libport/systemd_notify.c
+Copyright: Copyright disclaimed (all content required for interoperability)
+License: MIT-0
+
+Files: libproc/libproc.h libproc/Pcontrol.c
+Copyright: Copyright (c) 2003, 2025, Oracle and/or its affiliates. All rights reserved.
+License: UPL-1.0
+
+License: UPL-1.0
+ The Universal Permissive License (UPL), Version 1.0
+ .
+ Subject to the condition set forth below, permission is hereby granted
+ to any person obtaining a copy of this software, associated
+ documentation and/or data (collectively the "Software"), free of charge
+ and under any and all copyright rights in the Software, and any and all
+ patent rights owned or freely licensable by each licensor hereunder
+ covering either (i) the unmodified Software as contributed to or
+ provided by such licensor, or (ii) the Larger Works (as defined below),
+ to deal in both
+ .
+ (a) the Software, and
+ (b) any piece of software and/or hardware listed in the lrgrwrks.txt
+ file if one is included with the Software (each a “Larger Work” to which
+ the Software is contributed by such licensors),
+ .
+ without restriction, including without limitation the rights to copy,
+ create derivative works of, display, perform, and distribute the
+ Software and make, use, sell, offer for sale, import, export, have made,
+ and have sold the Software and the Larger Work(s), and to sublicense the
+ foregoing rights on either these or other terms.
+ .
+ This license is subject to the following condition:
+ The above copyright notice and either this complete permission notice or
+ at a minimum a reference to the UPL must be included in all copies or
+ substantial portions of the Software.
+ .
+ THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
+ OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
+ LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+ OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ Licensed under the Universal Permissive License v 1.0 as shown at
+ https://oss.oracle.com/licenses/upl.
+
+License: GPL-2
+ This program is free software; you can redistribute it
+ and/or modify it under the terms of the GNU General Public
+ License version 2 as published by the Free Software Foundation.
+ .
+ On Debian systems, the full text of the GNU General Public
+ License version 2 can be found in the file
+ `/usr/share/common-licenses/GPL-2'.
+
+License: GPL-2 with Linux-syscall-note exception
+ This program is free software; you can redistribute it
+ and/or modify it under the terms of the GNU General Public
+ License version 2 as published by the Free Software Foundation.
+ .
+ On Debian systems, the full text of the GNU General Public
+ License version 2 can be found in the file
+ `/usr/share/common-licenses/GPL-2'.
+ .
+ NOTE! This copyright does *not* cover user programs that use kernel
+ services by normal system calls - this is merely considered normal use
+ of the kernel, and does *not* fall under the heading of "derived work".
+ Also note that the GPL below is copyrighted by the Free Software
+ Foundation, but the instance of code that it refers to (the Linux
+ kernel) is copyrighted by me and others who actually wrote it.
+ .
+ Also note that the only valid version of the GPL as far as the kernel
+ is concerned is _this_ particular version of the license (ie v2, not
+ v2.2 or v3.x or whatever), unless explicitly otherwise stated.
+
+License: LGPL-2.1+
+ This file is part of the GNU C Library.
+ .
+ The GNU C Library is free software; you can redistribute it and/or
+ modify it under the terms of the GNU Lesser General Public
+ License as published by the Free Software Foundation; either
+ version 2.1 of the License, or (at your option) any later version.
+ .
+ The GNU C Library is distributed in the hope that it will be useful,
+ but WITHOUT ANY WARRANTY; without even the implied warranty of
+ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ Lesser General Public License for more details.
+ .
+ You should have received a copy of the GNU Lesser General Public
+ License along with the GNU C Library; if not, see
+ <https://www.gnu.org/licenses/>.
+
+License: MIT-0
+ MIT License
+ .
+ Permission is hereby granted, free of charge, to any person obtaining a
+ copy of this software and associated documentation files (the "Software"),
+ to deal in the Software without restriction, including without limitation
+ the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ and/or sell copies of the Software, and to permit persons to whom the
+ Software is furnished to do so, subject to the following conditions:
+ .
+ The above copyright notice and this permission notice shall be included in
+ all copies or substantial portions of the Software.
+ .
+ THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ DEALINGS IN THE SOFTWARE.
diff --git a/dists/debian/dtrace-tests.install b/dists/debian/dtrace-tests.install
new file mode 100644
index 00000000..a04ebfb9
--- /dev/null
+++ b/dists/debian/dtrace-tests.install
@@ -0,0 +1 @@
+usr//lib/${DEB_HOST_MULTIARCH}/dtrace/testsuite/
diff --git a/dists/debian/dtrace-tests.lintian-overrides b/dists/debian/dtrace-tests.lintian-overrides
new file mode 100644
index 00000000..22cbd6eb
--- /dev/null
+++ b/dists/debian/dtrace-tests.lintian-overrides
@@ -0,0 +1,8 @@
+dtrace-tests binary: unstripped-binary-or-object [*]
+dtrace-tests binary: unusual-interpreter dtrace [*.d]
+dtrace-tests binary: interpreter-not-absolute dtrace [*.d]
+dtrace-tests binary: executable-not-elf-or-script [*.d]
+dtrace-tests binary: relative-library-search-path RUNPATH test/triggers [*]
+dtrace-tests binary: statically-linked-binary [*]
+dtrace-tests binary: package-has-unnecessary-activation-of-ldconfig-trigger
+dtrace-tests binary: shared-library-lacks-prerequisites [*/dtrace/testsuite/test/triggers/libproc-dlmlib.so.0.0.0]
diff --git a/dists/debian/dtrace.docs b/dists/debian/dtrace.docs
new file mode 100644
index 00000000..7696583d
--- /dev/null
+++ b/dists/debian/dtrace.docs
@@ -0,0 +1 @@
+usr/share/doc/dtrace-${env:DEB_VERSION_UPSTREAM}/
diff --git a/dists/debian/dtrace.install b/dists/debian/dtrace.install
new file mode 100644
index 00000000..6be68ccb
--- /dev/null
+++ b/dists/debian/dtrace.install
@@ -0,0 +1 @@
+usr/sbin/dtrace
diff --git a/dists/debian/dtrace.lintian-overrides b/dists/debian/dtrace.lintian-overrides
new file mode 100644
index 00000000..11005f4a
--- /dev/null
+++ b/dists/debian/dtrace.lintian-overrides
@@ -0,0 +1 @@
+dtrace binary: unstripped-binary-or-object [*]
diff --git a/dists/debian/dtrace.manpages b/dists/debian/dtrace.manpages
new file mode 100644
index 00000000..e54b52b3
--- /dev/null
+++ b/dists/debian/dtrace.manpages
@@ -0,0 +1 @@
+usr/share/man/man8/dtrace.8
diff --git a/dists/debian/libdtrace2-dev.install b/dists/debian/libdtrace2-dev.install
new file mode 100644
index 00000000..b5e66db5
--- /dev/null
+++ b/dists/debian/libdtrace2-dev.install
@@ -0,0 +1,5 @@
+usr/lib/${DEB_HOST_MULTIARCH}/libdtrace.so
+usr/include/dtrace
+usr/include/dtrace.h
+usr/include/sys/dtrace.h
+usr/include/sys/dtrace_types.h
diff --git a/dists/debian/libdtrace2.install b/dists/debian/libdtrace2.install
new file mode 100644
index 00000000..36294de3
--- /dev/null
+++ b/dists/debian/libdtrace2.install
@@ -0,0 +1,12 @@
+usr/lib/${DEB_HOST_MULTIARCH}/dtrace/[0-9]*/
+usr/lib/${DEB_HOST_MULTIARCH}/dtrace/bpf_dlib.o
+usr/lib/${DEB_HOST_MULTIARCH}/dtrace/drti/
+usr/lib/${DEB_HOST_MULTIARCH}/dtrace/include/
+usr/lib/${DEB_HOST_MULTIARCH}/libdtrace.so.*
+usr/lib/${DEB_HOST_MULTIARCH}/pkgconfig/dtrace.pc
+usr/lib/${DEB_HOST_MULTIARCH}/pkgconfig/dtrace_sdt.pc
+usr/lib/systemd/system/dtprobed.service
+usr/lib/systemd/system/dtrace-usdt.target
+usr/lib/systemd/system-preset/50-dtprobed.preset
+usr/lib/udev/rules.d/60-dtprobed.rules
+usr/sbin/dtprobed
diff --git a/dists/debian/libdtrace2.lintian-overrides b/dists/debian/libdtrace2.lintian-overrides
new file mode 100644
index 00000000..34b4011d
--- /dev/null
+++ b/dists/debian/libdtrace2.lintian-overrides
@@ -0,0 +1,4 @@
+libdtrace2 binary: binary-from-other-architecture [*/dtrace/bpf_dlib.o]
+libdtrace2 binary: unstripped-binary-or-object [*]
+libdtrace2 binary: appstream-metadata-missing-modalias-provide usr/lib/udev/rules.d/60-dtprobed.rules
+libdtrace2 binary: systemd-service-file-refers-to-unusual-wantedby-target basic.target [usr/lib/systemd/system/dtprobed.service]
diff --git a/dists/debian/libdtrace2.manpages b/dists/debian/libdtrace2.manpages
new file mode 100644
index 00000000..fef53dc3
--- /dev/null
+++ b/dists/debian/libdtrace2.manpages
@@ -0,0 +1 @@
+usr/share/man/man8/dtprobed.8
diff --git a/dists/debian/mkChangelog b/dists/debian/mkChangelog
new file mode 100755
index 00000000..69958dca
--- /dev/null
+++ b/dists/debian/mkChangelog
@@ -0,0 +1,174 @@
+#!/usr/bin/awk -f
+
+#
+# This script can be used to convert the dtrace.spec into a Debian changelog
+# file.  It is intended to be invoked from the 'prep-debian' make target, but
+# it can be used manually as well:
+#	mkChangelog debian/control dtrace.spec > debian/changelog
+#
+
+function error(msg) {
+	print "E:"msg >"/dev/stderr";
+	err = 1;
+	exit(1);
+}
+
+BEGIN {
+	if (!dist)
+		dist = "UNRELEASED";
+	else if (dist != "unstable" && dist != "experimental")
+		error("Bad dist ("dist")");
+}
+
+/^Maintainer:/ {
+	sub(/^Maintainer: +/, "");
+	m_name = $0;
+	i = index(m_name, " <");
+	m_mail = substr(m_name, i + 1);
+	m_name = substr(m_name, 1, i - 1);
+
+	nextfile;
+}
+
+/^Name:/ {
+	pkg = $2;
+	next;
+}
+
+/^%changelog/ {
+	in_changelog = 1;
+	next;
+}
+
+!in_changelog {
+	next;
+}
+
+function lineWrap(p, s, line, len, l, n, m, i) {
+	n = length(p);
+	line = p;
+	len = n;
+
+	m = split(s, arr, / +/);
+	for (i = 1; i <= m; i++) {
+		l = length(arr[i]);
+		if (len + 1 + l >= 80) {
+			print line;
+			line = sprintf("%*s %s", n, "", arr[i]);
+			len = n + 1 + l;
+		} else {
+			line = line " " arr[i];
+			len += 1 + l;
+		}
+	}
+	delete arr;
+
+	print line;
+}
+
+function emitEntry(i, j, n) {
+	# Loop through the contributions, determining who each contribution
+	# should be credited to.  If there are multiple contributors, we pick
+	# the first one who is not the commit author (if any).
+	# If all contributions are from the commit author, we do not emit an
+	# explicit credit line.
+	for (i = 1; i <= lc; i++) {
+		gsub(/ \[Orabug[:;] [1-9][0-9]*(, [1-9][0-9]*)*\]/, "", lv[i]);
+		sub(/[ \t]+$/, "", lv[i]);
+		gsub(/  +/, " ", lv[i]);
+
+		cont = name;
+		if (match(lv[i], /\([^)]+\)$/) > 0) {
+			auth = substr(lv[i], RSTART + 1, RLENGTH - 2);
+			lv[i] = substr(lv[i], 1, RSTART - 1);
+			sub(/[ \t]+$/, "", lv[i]);
+			n = split(auth, arr, /, */);
+
+			# Find the first contributor not the commit author.
+			for (j = 1; j <= n; j++) {
+				if (arr[j] == name)
+					continue;
+				cont = arr[j];
+				break;
+			}
+			delete arr;
+		}
+
+		# Add to the list of contributions for this contributor.
+		if (cont in map)
+			map[cont] = map[cont] " " i;
+		else
+			map[cont] = i;
+	}
+
+	print pkg" ("vers") "dist"; urgency=medium";
+
+	# First emit contributions by people other than the commit author.
+	n = 0;
+	for (cont in map) {
+		if (cont == name)
+			continue;
+
+		n++;
+		print "\n  [ "cont" ]";
+		$0 = map[cont];
+		for (i = 1; i <= NF; i++)
+			lineWrap("  *", lv[int($i)]);
+	}
+	if (n > 0)
+		print "\n  [ "name" ]";
+	else
+		print "";
+
+	$0 = map[name];
+	for (i = 1; i <= NF; i++)
+		lineWrap("  *", lv[int($i)]);
+
+	delete map;
+
+	if (m_name) {
+		name = m_name;
+		mail = m_mail;
+		m_name = m_mail = 0;
+	}
+	print "\n -- "name" "mail"  "date" 00:00:00 +0000\n";
+}
+
+/^\* (Sun|Mon|Tue|Wed|Thu|Fri|Sat) [A-Z][a-z][a-z] [ 0-3][0-9] / {
+	date = $2", "$4" "$3" "$5;
+	i = index($0, " - ");
+	vers = substr($0, i + 3);
+	name = substr($0, 19, i - 19);
+	i = index(name, " <");
+	mail = substr(name, i + 1);
+	name = substr(name, 1, i - 1);
+	if (name == "")
+		error("No name in: "$0);
+
+	lc = 0;
+	delete lv;
+
+	next;
+}
+
+/^- / {
+	sub(/^- +/, "");
+	lv[++lc] = $0;
+	next;
+}
+
+NF == 0 {
+	emitEntry();
+	date = "";
+	next;
+}
+
+{
+	lv[lc] = lv[lc] $0;
+	next;
+}
+
+END {
+	if (date && !err)
+		emitEntry();
+}
diff --git a/dists/debian/patches/debian-configure.patch b/dists/debian/patches/debian-configure.patch
new file mode 100644
index 00000000..f8a6a698
--- /dev/null
+++ b/dists/debian/patches/debian-configure.patch
@@ -0,0 +1,17 @@
+Description: issue a warning for unknown configure options
+ The Debian build system specifies configure options that are not known to
+ the DTrace configure script.  They should not cause the configure script
+ to abort.
+
+--- dtrace-2.0.5.orig/configure
++++ dtrace-2.0.5/configure
+@@ -188,8 +188,7 @@ for option in "$@"; do
+               echo "Unknown option $option" >&2
+               exit 1
+            fi;;
+-        *) echo "Unknown option $option" >&2
+-           exit 1;;
++        *) echo "Unknown option $option" >&2;;
+     esac
+ done
+ 
diff --git a/dists/debian/patches/debian-fix-sed-path.patch b/dists/debian/patches/debian-fix-sed-path.patch
new file mode 100644
index 00000000..9a4865a2
--- /dev/null
+++ b/dists/debian/patches/debian-fix-sed-path.patch
@@ -0,0 +1,12 @@
+Description: change /usr/bin/sed into /bin/sed
+ A new test was added in 2.0.7 that refers to /usr/bin/sed which should be
+ changed to /bin/sed.  This patch will be applied to upstream as well.
+
+--- dtrace-2.0.5.orig/test/internals/libproc/err.bad_sh_link.r.p
++++ dtrace-2.0.5/test/internals/libproc/err.bad_sh_link.r.p
+@@ -1,4 +1,4 @@
+-#!/usr/bin/sed -Ef
++#!/bin/sed -Ef
+ # Fix up DEBUG lines
+ s/DEBUG [0-9]+:/DEBUG:/
+ s/, [0-9]+\]/, NNN]/
diff --git a/dists/debian/patches/series b/dists/debian/patches/series
new file mode 100644
index 00000000..99f0cdc5
--- /dev/null
+++ b/dists/debian/patches/series
@@ -0,0 +1,3 @@
+# You must remove unused comment lines for the released package.
+debian-configure.patch
+debian-fix-sed-path.patch
diff --git a/dists/debian/rules b/dists/debian/rules
new file mode 100755
index 00000000..8646ac1a
--- /dev/null
+++ b/dists/debian/rules
@@ -0,0 +1,24 @@
+#!/usr/bin/make -f
+# You must remove unused comment lines for the released package.
+export DH_VERBOSE = 1
+export DEB_BUILD_MAINT_OPTIONS = hardening=+all
+export DEB_CFLAGS_MAINT_APPEND  = -Wall -pedantic
+export DEB_LDFLAGS_MAINT_APPEND = -Wl,--as-needed
+
+include /usr/share/dpkg/pkg-info.mk
+
+export DEB_VERSION_UPSTREAM
+
+%:
+	dh $@
+
+override_dh_auto_configure:
+	dh_auto_configure -- --pkg-config-dir=\$${LIBDIR}/pkgconfig BPFC=bpf-gcc BPFLD=bpf-ld
+
+override_dh_strip:
+	dh_strip -Xdtrace
+
+override_dh_auto_test:
+
+override_dh_auto_install:
+	dh_auto_install -- install-test
diff --git a/dists/debian/source/format b/dists/debian/source/format
new file mode 100644
index 00000000..163aaf8d
--- /dev/null
+++ b/dists/debian/source/format
@@ -0,0 +1 @@
+3.0 (quilt)
-- 
2.53.0

