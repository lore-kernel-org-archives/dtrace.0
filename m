Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A413E35A3B1
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787944229; cv=fail; b=hC2iusAi+mRWxYHzZvXumYBcV+eLzvca3gi0rQSqfhRilz5rvXp2BaA6XADLcszSIJb8+rJBNGLVDHgpKJYGbpGjyo5OEqcWRZiz39cKB0AwB+Bds/aVUyRW7S1tgc+JUvRmXhyf94oGBwlDgBCIGdhWBTEocLhkqAyrY/m9dyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787944229; c=relaxed/simple;
	bh=NMEH7/zbAKTDQ35n7Jp8F/5olRitGA2A6zalrx5ryUw=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=G0BFEmXNCQQR+Io5cdrzrNKzlqd2dylPyfLVN0FIhB+zT48I3hpsrAmizKBiJZPa9SfSU8xr5W2i9YyAD6F8NxvvJ4L/iftQlg86DGYCWSrTMQb9GioLWd5+jUlC47mh7NK8ayeCjc66BcpsYu2jB3Cf5GyLca1DosuGkgrXzrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=B5g89AU3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Ntr8hgEw; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="B5g89AU3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Ntr8hgEw"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SHK2Kg3147326
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=BRly6pJC8BKYVLa7Se7esZpkXw3iIPPlNqRFJpKJWa0=; b=
	B5g89AU32zOL0hXsrfBZFZGp1Jsyzot1DtVzBiq78/Bf7Vl/ASLVdyqbFd4oVAjk
	rA/wdthqN3OZPScFI3yn4ry4YRebF/CGc4UGM1y+4JKQjOvdz6emGpx/MXE8PC7I
	eCL5DqTeLZDzidWfQuE1RpAfsaaxPCDjTdCDtybRFVlwCNcPCKJSioYVG5TByp9U
	WI9XTjdEPXvQy48stVFzC6nGAiyd3wSpjLrK3WJc43VLah68ERGCXFrDg67UrkAl
	Y0sf18YcAIfMQDU+mLh++wOLPrEVk/l9YtJPbQXpW86vcfdb7q+nAtNbIrQfxctB
	sb/j9tmqoR7OnaJn0X+EiA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g72j22fca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67SJA7xN015276
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:25 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010071.outbound.protection.outlook.com [52.101.61.71])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4g850yxwss-9
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bnjn3eSJQ+nijUSOwW37NuKTcuToHLJttMV2vRaYOhXL344bdMAnaYeNYjgeac9Oz7YXOgSj5X7/l0wilPRPcqvim6bYg45PERXiqeg+BeZ3yI/5w30bVcfl+Gv01EsCfEHCbZzIKfedmSkASnBGB7wEQBNZhzPrdOBt69FKK5W5eyFpmqc6RVhqmu15aKLQ5jCSEAeCnNfVyFINtGv9VatGrDUDMDfqm0YtdZMnhSPQI8v5QKFhjdA7iogtNp+ekgTz+Z4CWq9jgsnnJnnWfYkqx4DJxe6ZEbGaNJFZN9pJzCaId7uA4HnZXgerbgclV00ObjFH33XCptTLqcWuKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRly6pJC8BKYVLa7Se7esZpkXw3iIPPlNqRFJpKJWa0=;
 b=Hh4zPWvsnJcPMwKRVnK9JsTm/85YXm8j3mWHVUgAMFwJo+hiKIGEYbpxyNxjps4JdWPvzKE5cgJI2nlRJWVuqVISP4/vWPaM6biN2gEafzs1DwsjmE8cj0+Crd09p7DEIGaCOM6Gah4drq0a75gQ500E8xSD7f4JPI+GftO6nnHDgsvw/yvbQ3S9YxJpW+pcBJ9YrVAPP/kpsS9g3XEmWWXiKFD+MBysr1UCtn+aAud3j5vYLI8GC/h3RJTqtEZsQ6bWUAJp5fjbyhQmUb+D8h4zb59VNEnjVrP8Zd+/vFu6nj70sLhHYwnjDJEAy0jTK+1vETUHfFQHEkwt1prBkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRly6pJC8BKYVLa7Se7esZpkXw3iIPPlNqRFJpKJWa0=;
 b=Ntr8hgEwP+zHUpmue4IQBJzfJw8AVTWzWNc5FFc3WCxJ1s0d4p2CX4Wjc8iez4ht2mUfKFDrJDk7B5ZXuc7jwr1vMsSTIAJmxsYzf1KAmKKE24hAmvWJM5k9nCZCKr2LVrul9voqclzAl7Wo0EejMcAp4ZHLdUvhJ4nnb7P9Fck=
Received: from DM6PR10MB2476.namprd10.prod.outlook.com (2603:10b6:5:ae::24) by
 IA4PR10MB8397.namprd10.prod.outlook.com (2603:10b6:208:566::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8; Fri, 28 Aug 2026 19:10:19 +0000
Received: from DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537]) by DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537%5]) with mapi id 15.21.0382.007; Fri, 28 Aug 2026
 19:10:19 +0000
Date: Fri, 28 Aug 2026 19:09:22 +0000
Message-ID: <0508ff7039a7532b1f5eb94d6dd8aecb@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 6/6] dtprobed: fix dof_stash write failure handling
Content-Type: text/plain
X-ClientProxiedBy: PH8P220CA0062.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::33) To DM6PR10MB2476.namprd10.prod.outlook.com
 (2603:10b6:5:ae::24)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB2476:EE_|IA4PR10MB8397:EE_
X-MS-Office365-Filtering-Correlation-Id: 49b6738b-ef86-4812-c8e5-08df0537ff8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	RW0ZAu5n81zS2lLUWoH4a/OlC+JEQBZJZy/Fc3Tco8YuI20MoYclZiKr+adTxyMBh9aO9BUWi6Pbj+SYbN/QiRMuO7lwTxHglEKLAPuUiUuI5K/wY7ssDgGkpv/5kjlkE/Jy2HV0z0jN1JTSHP/UBdVJ2AT76EexIw8AU0jZWdnmiz4q3CoQI9vdz24/PY9S3tM+ifN5iyr4XDBTRpGQTkrGNwcRHl/OUf+kflJj4NcUJ6MdWmOSgMioRdPNnFuyUEsmOVZRqYCkX3TQHjZEUcKe5ThYv1FsLRaWI3+5fhz6w2jlZkPOYKZK3oo179LqJKY1d8v1xrCoZEzGoE7xOgz+aKTkmzqsHfmdwxRfQmGoFhFm+XwF+cWlvOU/pLweant2ihcwg3fI3L1oTXj5DD+rHwEYAmCWf3KeOU7BLlRZRuUse4qlx7A5Zp9QM5EUAebZ6kKKJG0TperXSFV4Usx9RuMejw2yraxcayFsQ2GYTP4VMa63V7vwfZPy0n2n8tZxcps0/M8Y0+Ug6aDUvvKW/pL+t5apfP5+0WuhUFUDtAjZezfxXdamS1FGk6KaZhflVMH59P0tFPkgsTmQFPx0DnsBMwBdQ3L61+gPMbm1M82frrqGJ9FQPATNrtnIwv2PQm90hZW44eOBAStv7Ndk7GaeAbTBKPU/2OdV9MU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB2476.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CqOUe8Px9AXqPj2w0KvL+YLcZtnVpGeskrAfyyjOWEqV2JIxufy/aQmVHRIm?=
 =?us-ascii?Q?6uAoEiXZi/eQmspl6o2zjIwdg9HnmyCrt4743TNgWo/qALnQLJ8fn8zrYhtK?=
 =?us-ascii?Q?cJYtgHj4vIcSyu6yMFMeDJCwJmcmMwL2sbw4zgvtoJbKIkamwgcwBQfRw84M?=
 =?us-ascii?Q?38UpB3NKf95DAEgDOgel6+UzVS6bvJB5jAqZSe8y4T1SoHeeL8/iS1iepPLX?=
 =?us-ascii?Q?qz5wA/LBoosDAmLMc7NiOdzYzB0LhvXh2DphS9ecr10O45TeyAQdl/D041hz?=
 =?us-ascii?Q?GT6NH6Ywe1CdfLymsLgW8ar6qj6GlXlnq+T3WoGj3dJ4EPVwN1H8db1aHApO?=
 =?us-ascii?Q?g3tdtDDl/gLcuyjL5f57Uc87JeAw6enOpbobRIF/vyy1K46ClauVoypOhnj0?=
 =?us-ascii?Q?bYoilNtBJsJFzqM4Q0K8s6wx5wWVkp5Lo53QiQtuuyR8pls/mNbjdpFrubaF?=
 =?us-ascii?Q?ajQyU0Hr23CU3l5UiV/bdmgSRqe2duy+UZgwqsdPF3QMscA/vUP0P2aQhURG?=
 =?us-ascii?Q?EVUaCOjwtvGFuJwOxaH66IFMNaVnmDevDlTglZtiWzD85qnyRCiJ5QMD4baH?=
 =?us-ascii?Q?sSFiIfQn0SP7vqSO8NVmvtbfy6rYTyFLERHDJjed/cP6zCcpPLErqoMeG1bQ?=
 =?us-ascii?Q?LkGv8mrhXiv9y+aLIPaFoSCdIOJCvtUSYxuw2Fn3nWelEHKEvRN/vqxTQemj?=
 =?us-ascii?Q?gqa4bs/vzblBzXWxWLHRAqQyt7pXA7qL0aofdzGErQz1gwkSqh77pWEZNgzD?=
 =?us-ascii?Q?YUGbGSP7KNnSClKfua2t2Bp4DolkZa7Kvi2NoJWnTbJd6Rp3Cl4PYVCefuUu?=
 =?us-ascii?Q?vJ/EjsPNZzjQ7ynX7qz9heoljyPsn/7MhLZbeH+gJzYKA7//ZoZCtzyZULCY?=
 =?us-ascii?Q?KouGnb1zyNXanHMrIHJ9uP4AGVdcl3LjAVkce8omqp4qZmRjWPnMJwnhGdQ3?=
 =?us-ascii?Q?tJZ/Rn5/4m6qrw+emsKxcFMYfC3jwcqhhm4mD6Yl6FxH6MZuBpoUWjbO2XNB?=
 =?us-ascii?Q?CzWb1nKnAxyieOluWn7D9Hip0nDQshJacn4tbtnQQlmQdeVnlRnqz6pZQsqg?=
 =?us-ascii?Q?K0bm5rEmbzLBM/Llqp++ymBbRrefFlITJNzwYmwDDcHUbLJbUMy8WyKERK0B?=
 =?us-ascii?Q?+S1RXDW6nuG7OXu8XN2NPT3lNwFyTpgSZOsLyGnq5xyQR+Gp5M486Pd/D8Tz?=
 =?us-ascii?Q?K3nnGANZT8ddNsQhVPN9gexxYkIoThLM1Qgiuvjnd1aM2p1Jms1gOMi2UFyO?=
 =?us-ascii?Q?98W/B/8PmQp7jYvBSy56jcW32ND+C8A+TyK99TEdJx9LzBnzzPt+ovU9NUVL?=
 =?us-ascii?Q?h8RGku9GWJQQP2j9IRV57GnlWOzmxjrx1yA4fKfvw9dmuj0jPy2vG7VqYpUW?=
 =?us-ascii?Q?nmRKuFC1Qs7e/fRPGDeTgHNL2o/i++pIYSCSUGC/a9ZFjfBqMpHTVhubnvZ9?=
 =?us-ascii?Q?mK1G/mZGQz+qaWJLcPTyj6wELDRoua4h6KODVXL9ULpQ6POk/zg7bBhfIohe?=
 =?us-ascii?Q?FQTRlzZghiWz0uzaghIjqDU6WYwYkPtdEEpW36FuxS8sOACwPww1+QZ0qzCq?=
 =?us-ascii?Q?MPnYHp2VTkYh0a1eX+sWd9CBY0EEmuB53EeZi2MmaS5+1KMlNtyLRVZ4qQR+?=
 =?us-ascii?Q?KEZhN4maQsUNo0c9BhK5A+tRre2VKMoZYQnjdfTy1EROt0h4a8OABype2AEp?=
 =?us-ascii?Q?7FGgCbAzcQoXOpDasQ7Ns2Dn4h73u+FWMs4kzJSJJu2xsGAJOIrJCwm40C3P?=
 =?us-ascii?Q?2F1I+L5bQ31ggtEllRO9ifvr8d8tlus=3D?=
X-Exchange-RoutingPolicyChecked:
	vGi1U2k4w39pwQ88OeYNOkhCX1IEpxqXv2Ma2W9Fvh0PBIXKmS+wTt0JxwzMz8OlBGu/b58vHvhycB04vdW7Hy3MBeSDAfdFhg/ecOO8jvGAtjIlhy/UkleqTYYpmTfc5MfZfwMLK4fq5WTgisC7rXPsqGy0PwtYXC0Sc2E7I+d/bwZBYy01PnLGml6YV560EpgNtn7BtkGXh6OhXv5gTZJiM/fM3uAxTQxUxwee6AV9Co2rqdXzay1YbTMEwRPbWCANW+hKKUQXQjTK2zaRujz+v8EfzNFL9tByBMqxTTIEm9EuBM8bt8O276Sc3ldu+pEsN/wkNCPrz0AsY6/S7g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EdOzeOKbBEe2pqDQ24TFHcigjqMovlkHNf8P0kSPm0GsKB+IyfgAiig8pQU7m3VArQFB7Id5wAw9G8XrlGKm8HcZCG1vYN3aKGe6sQLuekihDCwpTTlAo75OizMhoU3wo5gmQSX4dQrxScs0mtjqfY/tjaOmqAcMvKzZxivSrnusicfyKGIwjjOLHJcVM0uf1Jp8FFX8t9n2WsKgvq7IoM+Z4QEU6z/I/q8haujf8f9AOZGTTcS1kDbY3f6mdFllv8k4ZJ2+HaNZBoDoL+gEhlvzAUFOOLk+TCf1f6exRHKBt2+VkW7jqsBBI0g/Fyk6D/QrwF98w9uKVVYBIapwra80bjdWHzmjkWFj2NUB16rtL+hkRYoHt5K4UQqZXnMkHQN3xLvqZ/b+pcdc5CZSz8KJoGo9rPvAjO77lULeL4el9bFt30wxihXLB6SoPXL6Sw3v8bn9s6KROBW1EXo3gzEJ09anQQsG8aQO8RcaPB7q+w3S36KxDg5mqohNUxItFlEKJSZE1qVbyPDN7j8atTzgp1Sgwy+1L+5Nj/jIspXgI0scAl82YzTPcBGCwWHOWQ5C/e3yJaOkf29PDNSLctGiMn+dgs+eGrCZDAVrD24=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b6738b-ef86-4812-c8e5-08df0537ff8b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2476.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 19:10:17.9545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0J8zqo/gwD9ynYn2gJPHKHpqCa4mrZ6EkKDTSEwJzd01FR0IVktvZi79s0KjnTShmwgyHhpvmSiFOL2lIYqQajh4f3mWMwzepSuDaevi6So=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8397
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2608280167
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE2NyBTYWx0ZWRfX/y9aNeoS9eOq
 ZUSgdHavinyGZmTB2Db4l5TZZE3QcPCLV5yXTNp9delYFwim2C+pI9hlfB6C6M3rKPiBxH/oAUo
 bBTSPTgj3Ilcot06Sc27i6dwXEWstOk7SnrxxOLyR+Of/lgBopbU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE2NyBTYWx0ZWRfX0cEbAlgF5QiK
 cu2h5e1qeXwWheRz24UYydeLA7IjfAFqGOOTk9Ybby/0Nicnpzja+lxv+1y8Skv6P724NNuOZ/n
 U0HXT/Du/INtu3sZgpCbEsmBrxv3QxuZ9DOsiWwz5h8ZH0wWIokmWje4A151NXfZGrnthN1mSYw
 O4NwtiiWFGnsQI6Ln0esXwDqVPL10PUKmbr/cWNYhUGFTgyb7M+VV06ZSHFU5ZM7vocmumgqOB3
 MnhQ1iOsH6YyUMT5frYzr0nifUmq92BrluRBNUte6R1YP7JmcfnBlUCjhyny+wp9aICYdR3CliW
 gobgjSDg5sP1NCo6l2ToJxo7uL+a8fkJLzi6sQg5bkxdEZ9qRnmEt6olxXlwT7hrPFv0OK0HQuq
 K3Jt31J+Qp9YJERnw/7v72zBA3Ziogn/STg1lTqkVlimHY4vyctMlLpnmt9mD9NlPjFx5tBlBf4
 7AP1v/4bfCtyOPRyPtQ==
X-Proofpoint-GUID: 0daC153m7kc9THq6FB94ZjOo9lr3CFaP
X-Authority-Analysis: v=2.4 cv=Wek8rUhX c=1 sm=1 tr=0 ts=6a91dd22 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8 a=611DKdg8VLDS_sa-SRAA:9
X-Proofpoint-ORIG-GUID: 0daC153m7kc9THq6FB94ZjOo9lr3CFaP

Use ssize_t for write() results, retry interrupted writes without treating
the negative length as progress, and unwind through the provider-close
path if writing parsed DOF fails.  Replace the no-op assert(1) in the
corrupt-state path with abort().

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtprobed/dof_stash.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
index 6e62bdf6..144cc98d 100644
--- a/dtprobed/dof_stash.c
+++ b/dtprobed/dof_stash.c
@@ -420,10 +420,14 @@ write_chunk(int fd, const void *buf, size_t size)
 	char *bufptr = (char *) buf;
 
 	while (size > 0) {
-		size_t len;
+		ssize_t len;
 
-		if ((len = write(fd, bufptr, size)) < 0 && errno != EINTR)
-			return -1;
+		if ((len = write(fd, bufptr, size)) < 0) {
+			if (errno != EINTR)
+				return -1;
+			else
+				continue;
+		}
 
 		size -= len;
 		bufptr += len;
@@ -796,7 +800,7 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
 			state = accump->parsed->type;
 
 			if (write_chunk(parsed_fd, accump->parsed, accump->parsed->size) < 0)
-				goto err_probe_link;
+				goto err_provider_close;
 			break;
 
 		/* Error return from parser.  */
@@ -817,7 +821,7 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
 			 */
 			fuse_log(FUSE_LOG_ERR, "dtprobed: PID %i, %lx/%lx: internal error: corrupt parsed DOF: type %i\n",
 				 pid, dev, ino, accump->parsed->type);
-			assert(1);
+			abort();
 		}
 
 		free(parsedfn);
-- 
2.52.0

