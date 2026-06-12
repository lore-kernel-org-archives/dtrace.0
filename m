Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26F53D16F6
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281233; cv=fail; b=Bl2f8Z23MvAZGzec6SM7alqTUFqoRw9rDhkkCpBGm3Gtyqcf8XGVrRalrIisckJGTBb7bd4U0bj9IVlL8tt8i7+Q37ucsTIpVT/7cQZhTyzBsFgSDJl/h2UHz/3YKCYDtvkzmTTrsj7LeRxmCr3+kYX3jlvzQb6PUS1O4rp8P/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281233; c=relaxed/simple;
	bh=FLk2WPDV+9IwnSaM5yVdRqk6yYfw3wYTT7+XCvqNfZs=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=SPKUM2quYNe5fvXncc2PatAdsBrrTfOHQWk9yyq9F0WnkDILJ+Z4CxHbyGc1IPyTJwIdXb0PWhDe3tvwTW413CadagnhY0HsMfqMgeFvmfGz1FfzdivVxc4yOEMDWXv1SAEePVNGh43j02DmJ8DTvBKnfUHdX/EmyZHehtvO6hI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GGRrHMgY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZYATT7jL; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GGRrHMgY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZYATT7jL"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C7NKYY3948748
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=tr4i5Kn0xvIU5irUVBkeifgTbuSYnwL+v18fkn8RzEM=; b=
	GGRrHMgYR1oTMgUCIDP9QiIe/9IX7TuqcipHnuWR2tFtZjfHxZZ/MRb/GLhXQWaM
	AKlYVVKNsikrSN0b2sTaIhS6RZEi1KaZ2xuKkCSaVczWvti1bdSGu7Jjn3pAjj/Q
	1ONtl982g9rrak6ab25yQk4FGKfKJf5kl5AcR4VQh+IiDDRhBDF0U1xRYNIo1H5Z
	+p/2vZ1hVmzpRbzvy599Td01BckzSJNt8MGDuWyygPo+RlL0q2PAtdHwsfVecwUe
	PgyAhpyMhh6jzgFp9j8mU1Rf0TdLDziXOnoK3ixNRo36Oi40qn4tMEe+ENKVTbwp
	ddWNooZCRttiBgK46jPkyA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4eqe76b96e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:20:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 65CGD7pH014543
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:20:28 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011053.outbound.protection.outlook.com [52.101.52.53])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4erh0u2mvt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:20:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yaQ1OB2JhPYGo8prmZ37FRvKcGSlykVS0EORyRzC2e/qm8WIJqmO3ftu+hJFFQwoWzTSyudQgyYR879TjwonuafkwjjlKepIadehbGJ8Z7CZ5Ih5TJmu0c2uD1PLQ2Eyf7UwV4MR3Z3HiROMh+au/I17OzfS+4vC/fwA+UZ9N084C13E38OndVJanD1n7MY/VHCdCI7Y/dnEAyqXLy72cHfZWhj4o8i8CYmlXBGHpINraL8LQ2rztyYdEFZGbESNg6IRh7CRDliWIaggmXJPJGcNXAWEJ7+qEjRsv2fhF2LzkpZ+0FZl2QcyrKWt3x/+xAeO99NUekiDWicbLbT9VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tr4i5Kn0xvIU5irUVBkeifgTbuSYnwL+v18fkn8RzEM=;
 b=jFogB3OYLQZE+kjUK/ie2/j4mEP7S91l1lnr75q1TejYPY40I+2eqfipbYenJXcQoEN17ktX733dx9VOQkpZpsZlafJKSybiMLqSZvXt4wMB+jRUcMZ54yRnZ41uL4s+B/wjWgp73C2wamnRN8Wnex7RFch2iGqsTwBS/GE5bNFyZOVHSDZfn3K+uwUBCx/R51Sr6FgEBZcwI6mEutvHO3XDNVt60Koio1Qi9Nd2446xpaORPGalxSNuwLP7sLQcmTH44ZnHOZ+x6DBianfkx7T6X5GSGgXf3eCsh9nwPAv+edYu9W/YE+Zx9GFGMlIRnvLPLeuFvgs2L52QQmnNLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tr4i5Kn0xvIU5irUVBkeifgTbuSYnwL+v18fkn8RzEM=;
 b=ZYATT7jLMCnRAtrylU77NlpbloTT5TAjhPWG0xAafmo3KflVcyxESI7enYJK9yvIjhKAIWB5m7phH7wSTzWvYrKkeI3NcYwPLSjkpVkW/IgzZZwaqJnaFifM74wHqfm9pHru0zBlcsCEIVkK6borDtyJXt5A/3Uq7GJhGpt6G2Y=
Received: from PH0PR10MB5514.namprd10.prod.outlook.com (2603:10b6:510:106::17)
 by MW4PR10MB6419.namprd10.prod.outlook.com (2603:10b6:303:20f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 16:20:23 +0000
Received: from PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61]) by PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 16:20:22 +0000
Date: Fri, 12 Jun 2026 16:20:18 +0000
Message-ID: <6a4ed09d8c3ecde2a214c5dc73c76781@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/6] dtprobed: reject oversized DOF consistently
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:610:cd::12) To PH0PR10MB5514.namprd10.prod.outlook.com
 (2603:10b6:510:106::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5514:EE_|MW4PR10MB6419:EE_
X-MS-Office365-Filtering-Correlation-Id: 81ae1ec1-f75f-4e82-a90d-08dec89e80ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	cDUM5omkZP2W/+d6595m1BNaoIUzOgr1SHD9Fqy3zTw/srelObZ/OKyZfmzKEHte6gne68oej3uq02p5nvFxOBY5W3pGb3ydQ/BXqU1zOJYyf5y0HfSBo5cb5rVsxhihPJ4oFDZF/pUr/z0yubvEzPVxj4DK74YJEO7pN5BkvDfqxgbJ7jdavOVXbW40dVkJGTbpW7bb6656kwAwnTgwGghBAjJiFG/Az1tBQev71HQpb5BW71WCmQyoQfUdKqdqFcwiIjKHBab3w2UaATBJD7/Q0bnIlXjtDNFWuS0dH0Ag+x45yvr64X4+F73JZV4+Qz1BQktLOHAT7Fj/hBS6pgWZq3zT3G9ufNbEBzwLs0uqpicM6lb//wl8jCbihGpKoTugXe1wpjE+lncM7SyFIFDa50xUqWzas98kPdrJiY/D/ucL8S+CjJVe4M0xjGju610sHM2AW5E3p7Qp1sRsXz9wsWaMNsYYf44Ka6D60eFqSQhVRtVhfJzNTH3LGiWAS8FzAmqaUXQbncMKCCuDcOWP+SaUnYF4OVr45Zjj9w7O6zsYYUyokkOwdoSafvdsow8wKtPedRcp5ssB2divcqiHYKU7rMnghcqaFWBjfjULXtllVNOuvI8NiX68kQO0GUQQBnp6/3tIsG89P2q3ZPVZTSzTVLLjJ3viI92d+S7ww/+5cAyuz5D7epncSjsc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5514.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6zsysAF+TFFEcq95jU4fRckaz+apRFOZgZWuoVHSA8V6BFSZU109LrPtG9dP?=
 =?us-ascii?Q?96TtFYhNk0oV+Q8vJR6ha6q5UlUJ9XMhQy+2ySmyudyyIaJacUyQz0+Zw5uT?=
 =?us-ascii?Q?xyyxJnDgWvt6SoTOCSYRZaAMzeD9koLwEDRm1HpHH0xBZJDgKcFwAaR4n24o?=
 =?us-ascii?Q?oAK5JZqb38DmWaz+G6mSK2IP9zELQRjI8YEGRQtjE6Tdx+65YLbjCA0Nb6GN?=
 =?us-ascii?Q?7YnVArzo+fbCy/ZqQEBUQgKOgcLNOD5LFA13JERuM1k+D8j4Yp06DJCCkZQ6?=
 =?us-ascii?Q?UX+62wtwlWli+u3FIcV0pHU/vjeoi5tiP4MgaEQMmuM1uY+hQSQ9eliUcU09?=
 =?us-ascii?Q?iv+FdZi4BRXkYDCv3+zGv4f5e0ca5jRZiG1QkAPshab7P8VvW7NJIjk2aVua?=
 =?us-ascii?Q?M/ione0suI3BMavZZiQG/ktRYXhEVhBf89biqqCdI3/dvMK1tVJ/L4W4Pasa?=
 =?us-ascii?Q?zb8XLvZY0yA6jw0DCoQJdXzy3CDMd0Av0cDV5Vst6eGKbLnBhqPpr4UqLt+O?=
 =?us-ascii?Q?kcrWG5138IVZgYJCK5NZGuiM+kAoLXkfaSGgnY6vGkIkfeJde1uLA0iVeAVx?=
 =?us-ascii?Q?fsEtxP1rD2Ckyg1s8J6/mKsAsGgNqAiSCaWcS4bQV0UA3cOyNtE4HDnXHHKk?=
 =?us-ascii?Q?tdfXaCs7bsxU9Y396Xq6kKp+SGmW49JGbypHs5CAisUTK+ttecXwlKc3vBO/?=
 =?us-ascii?Q?k7GzZWLfDh7R86ke/zskQZNVR9s6stJjQnj74HFO5peY4nVxoVJ+M5eily0h?=
 =?us-ascii?Q?5AJHLpAACYxmP7FgD1Cc+VUDpasRjo/5IhhpVmp/K/5dR5AHpJ/lF44SiXfl?=
 =?us-ascii?Q?Lw1G6Iq3ynhWjQjt6ZH1WI6fycg1wtnLD6GsgqLeUtcMjKN7bKnOibVEP2YZ?=
 =?us-ascii?Q?FO0MHupJ/UckLiVDCORFXfH48po97q331Dx9AUJ6E2WN2jlivXByNduES3sf?=
 =?us-ascii?Q?CW00xTho7XaYZJo0aJSyAOUv0PF6FQEhVFFnZ7cxrkvYn6w6kkiT5PAQIbSm?=
 =?us-ascii?Q?R/jjbwB7MsBaxF+YbKx+q6tu6xdbOFFGE0gSnzYnRAfgLMG+TZl95RFwRT/1?=
 =?us-ascii?Q?AwssXOsCDGqsAApq3rJQAHy60DaqI0b1+u5cf6ZNJaDtkesJJuab+DkMfYoV?=
 =?us-ascii?Q?T6Se5d4SpSz/2a5AKVipCxWTFtnhvgNXgy+hPzK+vhXeR99zYT46DULxPFv9?=
 =?us-ascii?Q?xdPZeIQwFV6ozRnhyD73+NBxXRJCiUUI0r8PBm6dc8gYcGmZ1krlmUL5Jiks?=
 =?us-ascii?Q?oTXzrdgfMPOsFFIPZqMGPwAN41sI3QhMw65+OY1b/lisYFcsj44URsn6VfBi?=
 =?us-ascii?Q?WfKlqTr/JvRVo6+HUd4rk93GBbQ+XWdNsNOLE2HTRF+fw9TnQEWFZ0lMI2Aq?=
 =?us-ascii?Q?5W6+ab876x1BuRpzRscE0KI0EsP28dIXuYPoAfLR9OWkTtu9Gsc63EEB0p2C?=
 =?us-ascii?Q?7SJonhouSR6SPddS0XRo4pNRWlUe9iqZDbIt1jHRia4meA9ou3L+kAp4yNVs?=
 =?us-ascii?Q?Y7We8lNeZDfUh/Ed2fjRY00IMH+N01+SWkQUJtV/TH2YYZTpbYCrVfiiBAcI?=
 =?us-ascii?Q?QzW/GhJUDmTNqS/GPxSqVE3VvAvIppfy5NmE6rXJXsyv8GqJ6rSUJdLM7yoT?=
 =?us-ascii?Q?//BAUSXj7+5Tids26wUm4ryy4u7v69lJDK2weVtEm/zD8La28RReBFNLlCh5?=
 =?us-ascii?Q?iBSxIRNMFBSxg3E95ExqVxE5xLmYoUGY93rLepAFx1NueTLHeOS7BQZHvXww?=
 =?us-ascii?Q?ISk/o+2kiQzHuKLIl0wW3h9eX3O0roA=3D?=
X-Exchange-RoutingPolicyChecked:
	URXJdHk7m19AChnCdlPiUovja49eQHELOSaTAbcaMajyi2p68DMwtCNAKPYzG39q+KImQcZRpsjb8H3FbbaKU3j3vMK+5Nj3tZAlML1cNQmPy9aMdRanz3sbLzuZd4Vik6os6g0NDAM3H0/toXviEbwQQwV3lDQg/RByIhlHDG2d/uwYpmBuFohVMsBvuverXwxz8pzyO4RlYQ69So72fNaQnj6qujqUjC6bBC0GBXiO4ISPbdpYWSEEIZrIAS2crEun8kXrlvNnOjLVQfHdOVQNiwAKan18wjeAqPCRF4YbZS9PlRwZRgJrTYo16WXIDo340c9WbEr4/Do+P6JKsg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	w6YyExJJUgnNbKBpfjO3+mgmRDT9hZXVQ5eND/3aNrxauhsZz95yi1W7DNL8wSy3ejsk5Hh7IWqw3PS6AuarO9gP0CGYFnYHmXtl3+OolYu6Z6uVArL3yKuBzRO9pN4D916Ido22v/9Ox4DQh6Da3zV2o803TVt6nVDSChMHOqv1/LeigS62HsYt0oEI1T3ar0vM2KxUWgS/xLnRj3KXumZEpK5xYekyMy9P6skeMro8YmxQ1jm4eoWSu8rvmSQYF4otkCaElknt0ypJ7PmG6VRo2Dl8L3agST/11r+Z1QukRoRymDP1B68kBqzMsVFtQsc3NHVL4yVPHhpYQz81srb9xDpe+D/op+9xoe7GhsZcUyjNpCL5kDP2VX/FAe2Zzfu+6hWLloEnQyzPUXwHBGfzYh0kOsCf+OO5f/weVuB0zDhR5aBBAflvGRMKPi7QUW42CdNirOlYTExzFaAHC99jDejj0uzFLzbJwlFzr69YEVreWpLNSB8JWCI043adFAcz4G2/v7UhLnilMr29ld7MtIxeQq5vHTWE0+kMuDwE28puseA5dDl2FjKEsW3POsjgJqQZPsWkuE9a3tNVLgiuHTowzzvVtpTDeOOYr6s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ae1ec1-f75f-4e82-a90d-08dec89e80ce
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5514.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 16:20:22.5733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfHoOa/TQFnKekaLI/kBsu/1sTjsdFMfV6CfBsKVX+X3fM842dI9mukLlmfUUOdfwtAoa/GVGiIevVa/du7oWnqVCTSHcaoU6y7eJ/OiQvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6419
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 mlxlogscore=818 mlxscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606040000 definitions=main-2606120150
X-Authority-Analysis: v=2.4 cv=W6gIkxWk c=1 sm=1 tr=0 ts=6a2c31cc cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8 a=pu6FpPkusqEyjUOZSJcA:9
X-Proofpoint-GUID: hoy_swCIuHX-m0J3h6MM0vK1ulTlErOg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE1MSBTYWx0ZWRfXzMjLcmrRYzDA
 /3YCAxuDBBRLt/4fe0UjJd5Yb9W3ZXybIgIKxatB1GQDJA+8B14Wv/05xETjnDXZWCNKS2JsjBg
 9fsmp5aF64OhNjeQZaQrP8XrRqkajdw3auWfXZxWRiUeIsQ0Ofa6cfABn/htZjB17sFlx5TQlsc
 D0I6Ivrh8qAm5S+mGMF0cm5dbpWdEmRIFA1wLjqHGtJ6/wpb4pDLWHKTzfJqZym1lT+QQlyyLWb
 uhjA6PGN8OF7vPDz6NVBgSKMtZE4b0eBv8S8L56OfDZqZJeOodTGdPHNjJeQQ9rSps72Ki2xfOC
 N+QEadLrA3cNEqHJdjE4zPAXavgEAFRRVYRqjG2VvCH1uPRWT5BjijcvM7Y6yUqJO1IeK5KST70
 Ewm6Jji0WENz7dh5Adk9uBwSWMy8fQAG0POB5UuRXL790kvn5u8LQiK867JZvG36Bit/ND7MyfV
 Q4nbrcb24kAYgIfRetg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE1MSBTYWx0ZWRfX6U/l8D/Hv9vR
 vXiv7FbCzyxJd6sw2xjI6MPckDx21uB3zvx9VuW01U9vLPkb4SrZEXZMJIZH7Nu5zzTW5ykSskz
 fzeabDnOPExEJlx3cQeJAHhG142wWZnCBNoCQTtbDM+HwM5OkaGa
X-Proofpoint-ORIG-GUID: hoy_swCIuHX-m0J3h6MM0vK1ulTlErOg

The dtprobed ioctl handler warned when helper DOF exceeded the parser
limit, but still attempted to allocate and copy it.  Share DOF_MAXSZ with
the parser and fail the ioctl when dofh_loadsz is too large, so both paths
enforce the same 256MB limit.

Orabug: 39351859
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtprobed/dtprobed.c     | 8 ++++----
 libcommon/usdt_parser.c | 7 +++----
 libcommon/usdt_parser.h | 2 ++
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index 37d615bb..81b28e6d 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -69,7 +69,6 @@
 
 #include "seccomp-assistance.h"
 
-#define DOF_MAXSZ 512 * 1024 * 1024
 #define DOF_CHUNKSZ 64 * 1024
 
 static struct fuse_session *cuse_session;
@@ -769,11 +768,12 @@ helper_ioctl(fuse_req_t req, int cmd, void *arg,
 		}
 		memcpy(&userdata->dof_hdr, in_buf, sizeof(dof_hdr_t));
 
-		if (userdata->dof_hdr.dofh_loadsz > DOF_MAXSZ)
-			fuse_log(FUSE_LOG_WARNING, "%i: dtprobed: DOF size of %zi longer than is sane\n",
+		if (userdata->dof_hdr.dofh_loadsz > DOF_MAXSZ) {
+			fuse_log(FUSE_LOG_ERR, "%i: dtprobed: DOF size of %zi longer than is sane\n",
 				 pid, userdata->dof_hdr.dofh_loadsz);
 
-		/* Fall through. */
+			goto fuse_err;
+		}
 	}
 
 	/*
diff --git a/libcommon/usdt_parser.c b/libcommon/usdt_parser.c
index 86419809..1dc2fffb 100644
--- a/libcommon/usdt_parser.c
+++ b/libcommon/usdt_parser.c
@@ -19,7 +19,6 @@
 #include "usdt_parser.h"
 
 size_t			usdt_maxcount = 2;
-size_t			usdt_maxsize = 256 * 1024 * 1024;
 
 _dt_printflike_(3, 4)
 void
@@ -131,9 +130,9 @@ usdt_copyin_block(int in, int out, int *ok)
 		abort();
 
 	/* Validate the data size. */
-	if (data->size >= usdt_maxsize) {
-		usdt_error(out, E2BIG, "data size %zi exceeds maximum %zi",
-			   data->size, usdt_maxsize);
+	if (data->size > DOF_MAXSZ) {
+		usdt_error(out, E2BIG, "data size %zi exceeds maximum %i",
+			   data->size, DOF_MAXSZ);
 		return NULL;
 	}
 
diff --git a/libcommon/usdt_parser.h b/libcommon/usdt_parser.h
index d33370e4..b11207d1 100644
--- a/libcommon/usdt_parser.h
+++ b/libcommon/usdt_parser.h
@@ -15,6 +15,8 @@
 #include <dtrace/dof.h>
 #include <dtrace/helpers.h>
 
+#define DOF_MAXSZ	(256 * 1024 * 1024)
+
 /*
  * Data transfer unit for the DOF parser.
  */
-- 
2.47.3

