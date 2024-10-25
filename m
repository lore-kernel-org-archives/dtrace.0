Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4FA18F2F7
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 06:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729838074; cv=fail; b=U3H+SJa121HSdhXI5emw92pABFSX5hwGrHF7hq/YPwgaepgJyx0qsS43wr8F891SgzdXFVqD21vZdqRxake6PwYO66tgwRT0TaipWDOmp9Qm0D1Z7WyYtCIchCUpyL/P4nPztL5i5OzzXQAqVnMg8PhEsT3zIOOgZyGgR0WAEoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729838074; c=relaxed/simple;
	bh=oenxfR/ZVXwJtmqWpBhFDLwD9PpImqnRowNhHkFPHUk=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Or3Pju1Ri2VR12GWHNhwzh2a1VgHpf9e1oPpv+XX93JSHJIHQoNCk3tJpb42aJ7rb11AhQoAe5xWbo/x8w3/NYm0Xg4Opkgx2UXFNFFhdHazsCrnWOp3D/+5qHi1QZHwho/otkQ2M6k5XSVQpYV6WAL4uuOYPqH/XiBlG6Hq1Uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mdxc7zD6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Y23UF/OW; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mdxc7zD6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Y23UF/OW"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P2fvwX030204
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 06:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=ck0ipPTcUA7elKEoRhCMuKe93tvqYW8iXoZYPUNCvMo=; b=
	mdxc7zD6FEPNGPxFsEjxWh/uh85kSyAKYGxqW3b9p2mtHvR0Gz2zXmMwypD9Mj6S
	PBZz0ZSO5Zn4a97mcLTkyCpokTPebrqDZSTkMnza+YsPSOaUv7P7tf4n2t7H9/iD
	gme+fibLHdUnK6BAR1EEmGyeBuu00dWlPlI+X7KY+ixJLouV9T5hn450+m545GRz
	Y8wB9/AVswXhELyGZOACY1V+f3Y+4tRe1IJj0HzfXclikPjO0+Im7zYWUanmaelp
	aN71awJLoPv/EIL3Y8jPoVodmZCCdORZ6CLaTXI5ndfMZAnM82xtGThAcx1iVNdi
	ldFNaQfD594SFRLgpcKPcQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c53uv8yc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 06:34:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49P5RKuE018749
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 06:34:28 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emhn0h08-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 06:34:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KnrHJZgCrpInMj7kunskreMD2MtoHcEhv4TqiaW0v6zPH6RJPMUqdyLRaPL0WWD55/Y4eaHNmaIy0cz9UUDQ9qQ5Vp665sjsO/PtaPChZafMaFgRZIxezsiiNAIwolQgebBXz0LUNv8Jbjy1QR+fO9ENCZYsqFQS992J431MxM+c/dna+i9IDBjr4sAtNZH38PD/Xil1vrkW9sEnTexSWQ0woDidhbaTC0aXkEvEnc8Msqeq3H258UkUVtSnE72QEiscl0zrX3nXQsS983ZlNyL+H7vS0neEuNH9GGA5Efrr13G4r42WU36w5kzVNHQfNdHU5a2sEzUybCHfhoqrjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ck0ipPTcUA7elKEoRhCMuKe93tvqYW8iXoZYPUNCvMo=;
 b=gKbrzoz+7A77l8iCvGSVM0IupoSyJOm6TKqqmcyfgOLrHRt2RaCEXRAh1AUmAQ8iRdDg+OkXWzhX9I9Yo83GcIfMdv20GURoKeUxA9c9wAje+i/yq0NUHFrary/eHxxe9hPPZCzPZ+ex/nbEUx4BMb2OLFT8uphcxUdL1n+t1hrssmS/7AZyNMgnbWdYLDmk+j2mGxtV0P2XEA3uWCaYfuXv34TB1IcG7fFS0D1xZhsNVdYikSDlzIaxKM3yjrhKf0tth7fa5oBZGU9wQK1mTp9k6Uoe9e35tSPqveU1nK15L5JTSJlRNF/GueDV2qGx8kqIoSx0ttMbUZexnt4Npg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ck0ipPTcUA7elKEoRhCMuKe93tvqYW8iXoZYPUNCvMo=;
 b=Y23UF/OWGuucwJdP06h3o1tlgN+cvUqd0PF2wvBMcV1KwsH3QYFd2Dy6nZYL9mKO/ciZ/KikmUpy3GqpgsHlcRvrBZvIEukMguPc6sgYGnEUpHP1J467Y0Idkmn/gRc3ry88mtufqNeOo1myHAj87WQsminq6BRykP1SkirnuWA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6532.namprd10.prod.outlook.com (2603:10b6:510:203::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Fri, 25 Oct
 2024 06:34:26 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 06:34:25 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 08/19] Support multiple overlying probes in the uprobe trampoline
Date: Fri, 25 Oct 2024 02:34:21 -0400
Message-Id: <20241025063423.20479-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BN8PR15CA0053.namprd15.prod.outlook.com
 (2603:10b6:408:80::30) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f2db0b3-5fcc-44ac-c950-08dcf4bf11fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?URzMD0Pr7lbRilVadkhUczPhSLiOBhA9Ms2jsPOzW0J6LJzbxcGiNn42D+Wr?=
 =?us-ascii?Q?/p1ysjWbMvRIF7YXncujwdiEWtH80lwagK42r1dxLBOOKn8UN16P4kMCoNtY?=
 =?us-ascii?Q?VO3aJpWcp5WwgNpJpGKT+WMeq3jHr9pmPgfMf2Uo4feiec4cvjFwS7DzAGTC?=
 =?us-ascii?Q?CzeCPUUYbvJ9BggMXLULPpNS9Tnjsth9I2v5daKvtLt8LUCFT0OmEcBhV1Xc?=
 =?us-ascii?Q?zbxbKzWng03tHHArB/QRuKGvwptKVp1/5NM3uMPbkdcdEtKK62B7o7otFWs/?=
 =?us-ascii?Q?RTkZ9Y3wabcgioYBRyeJcKUfopUco1wjjUTDHmbKCSwmSl5jrOhyO64Gf0a9?=
 =?us-ascii?Q?Qep6yn4Sj9doJ3VfgHuSLXdliFiIpXy25dQXuyGfXglU2agppTgYSvdS04tK?=
 =?us-ascii?Q?pU3jj+4HSQnbI2+wsY65gC8HHI7PRWNHN3K775IwdlRvJMFA5pzLYnZ4KWnG?=
 =?us-ascii?Q?volZWVLQI0jiHqXRw5qqUW4m/kyO4wMG9rrAasllGM7aif1vMULCIpFHpT8/?=
 =?us-ascii?Q?uTGkkBaSLpPVZMSHUb3xqWoU9rVLy3igAdZ8qtrrDlkmJXtAbLJCdeJpcCtH?=
 =?us-ascii?Q?KBUnf7yRuZHB7Q5c8G5qsR01NM0pH7gTCe15FBq1bRq/PVG6J+NKq66zyLZn?=
 =?us-ascii?Q?3DyV0huGeXhV7jjbmpvzRAZtFbSIUY3rNJ9kxSykeXubpFKeDk6UqHRpCx10?=
 =?us-ascii?Q?bNm2rBwLVkuq9Jti7uUjnaQyWxWCN7M2i9wZGtckRkfVgvi43+Pf0MAJGftu?=
 =?us-ascii?Q?OBB7MLrYv17XB99SPlTIoWZ3SxhdjiovGQf0/gs8a5bL0+u8iLaVtYADPCa3?=
 =?us-ascii?Q?Ui0JneW1GmCPJlx+qecPHs0B2BdH/m6R0LQZ0KY6po5IepPjIm4XUEDjeR/L?=
 =?us-ascii?Q?7le0B2bkqbIhEcrd6axPedhFneiipw0NMcmvkMjCAioT/SPQBtr54rCVsz9h?=
 =?us-ascii?Q?47TC/OQ+izZi7TTOlCnsM5bbkJdxOCx+huA7H6DNx3gIM8glJk2PblAXfTuM?=
 =?us-ascii?Q?A/n9mwm2ZKMbwZLRGrAtVgjFeGvznK077z1HKk6kFZzZkbetv76bkLkPQK3O?=
 =?us-ascii?Q?yIp+miD4eHxLaAyPmRcZZhcYE4x7SK+L4F8BuRuRDqsbusOPci4DCqPjUWzq?=
 =?us-ascii?Q?zlhLuw5C77CAJyEHBm21Turd4S8H7xwsn3Yc0Fd15+aSpDJE5HHoLGp6noYn?=
 =?us-ascii?Q?YmUuFwMVO7AFZqEV+Iad6j+pyzhkmyZbSmQVGs8AKzSCJQKh6VsDizxqLtH5?=
 =?us-ascii?Q?VSlxyiYwr5jWHrDl5nLP/ENJeHjEjVcAD8q51B0Jm+N1gdN7GKZ5OLItN3h2?=
 =?us-ascii?Q?51V2zBiLCIQwhSWgiVCwSuAd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hU6gYmRcyFGvBh1NgoCdUJLJO/HSsPMc36zlYeB7QYX/+empuD8+JG+u5r8i?=
 =?us-ascii?Q?ts9DP0t5mvIY5I5ZUddTW+7L/nvzxo8Pqu2+c4SU/q65MjQ/XSjuGEqTBZ+E?=
 =?us-ascii?Q?ysOL3IJ3co/6aQkNowHhr71MHlk8OwQuIfdzpRJFL/l9XpegVwjmzQ4+HtAp?=
 =?us-ascii?Q?wzAfeTj3zDgXTZXkNggJkfJwCPUqyYu1Lsi6F6UJgvNxqPmCnPVpDXWTKQe+?=
 =?us-ascii?Q?AOMOWKvDzCIazuZovzhzUANXeNLzVlJqunzat5iIvKYLBW6XebZnB66y1DzZ?=
 =?us-ascii?Q?i9cbYLNs/MVp2aTl31XJyZPxpwM7SdwlP7IIfEq0lrdJqeHvjW6AyFtQRkve?=
 =?us-ascii?Q?IYXWLcqd6sTrcW7L+CTnlyUoBNZdLblawf7M43QRlLexVTsNrbPHslcNtKC3?=
 =?us-ascii?Q?k05SmJ4WydmN+gvOj4eCPKV6u58A1STqPRY71czgcTuX90eggnYDdltJ13LE?=
 =?us-ascii?Q?no6YOjUpXTWpgVo/oDglprFoE7njizkoieiqevoIOPyWTAwQrOddYasxy5lO?=
 =?us-ascii?Q?w3yFnWFtTHLe8nm+GIrFdosPr62DhA+ToorC/1zq5zxP46nvpqInquQ6ZLVS?=
 =?us-ascii?Q?/80/hAW7sKw13e3pY/7ucL9l6xU8/7+fQuYwJzHBmy1G06SUnOrlTHjb730y?=
 =?us-ascii?Q?IWHEqiGx8SuS8EUbJHAuK5mkH438JWKhwOIqcrJNuelSGeGF1BhL/AW8XvMi?=
 =?us-ascii?Q?LV6mVtv9ibm+vGQ6fYbr9gPmlsve91kobV0xHEMv0wACfiSTl/B1YBWtFynz?=
 =?us-ascii?Q?VhigUaW0lNSFNrzTIynO4GO9egZYekHtg/NxhOjPRRZ0H42vLgplOYaUcgo5?=
 =?us-ascii?Q?n0otuMIRKsYlCeTWYetLwh/9GvC5m37Ob4Ab5MmyossAqux2Mqa6X8uKOueI?=
 =?us-ascii?Q?9fa1zINP+L60/fEe4noB6OmIRh6v3mfVg5ZsyCPLB7hvC7a/Rwq5eIWAqO/Y?=
 =?us-ascii?Q?SODEB9cphinIs73RZ1eHD/7Wn0YbacCKFWYV1veI1fjU53bgdJ+5HQwEuSTb?=
 =?us-ascii?Q?8D5RAE/jwkGnX0u4g2wnLkxqbdfgAxoouqaI/xYsBWYSGFI8cqXwix+C1IRL?=
 =?us-ascii?Q?KPDRwb/EpSNljk86WSdTDDRrVfpAxUofqRqzgkMTQdrXOnejYKQ7aYvqnWoE?=
 =?us-ascii?Q?h8K0gafH3uACGgauVVtpFXaG9DPA26FK4i4yiKwH7+VARdodbrhd6Ed1sYU2?=
 =?us-ascii?Q?wgF3iL9rmRp5HIpytSuvxosl0tc0G9ODPMaBDU7kxKoTph5oY39ReloNsiCw?=
 =?us-ascii?Q?xJS7VZYvoweGARJ+cDAXbgWbI8Ihe2on0cziwHQRG/St+cF+k2qk1nFO++Og?=
 =?us-ascii?Q?QVwyZGerbax5q+z8NeSWlANBW0dgQ4l7klRjy5+iUk6Rve3IR35yHeGqnCcF?=
 =?us-ascii?Q?S/8xX3/KbIUObWj4s6WD26Yfu//Flb2404E1glfiGzZ/9TLugV+B0oKoBQU7?=
 =?us-ascii?Q?aXJnbJsjcsrfVOKwfKAN2Bz47XfMfvBcP2ks3sTcRFea0lsUSnvtuBa3s291?=
 =?us-ascii?Q?d1BM1CkZc9ZMaR2+zA4HsmB6jsd7knT59EM+CKIkKFy8WqNVR22H8LaPvAXu?=
 =?us-ascii?Q?KJ5KGwbVmDSOtsQDm91dEnrnTjR0cxLSS1QGugJD?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8LNe9G4iofb5uAdDoWmNOEBs/ILNle3hxII8KnWTzJAjEhfNNBYmqlUKVHVE4UaqgNd6KQeNQL7+ft9eAYAx/C1CsS8OIj26P64lVFQCy1hhHxF+JHF6yHhkhQloQB9A3MP999hJ+a9EgOJZaNmFCriFFb5CnZCkad6wALM3MyWIAf0bAKd85wp7E2Emjv6BFNqTE+5VgyCoy11CwfS6RVAy3fvCPaiTwM6QlM1wj1aL5pokrLA45goCoNEfM+njFUpBR0+Q1DXqywIJS8gsMRE5SDoi1J81dT1RudBBlIDAusITyDYAZ3B+VcIYcqMDU6y5yYNuxktWfFVns5dvH6R8K1Kk/qLuOcnfwSzwRV+8q8S9h21B5eoJE+Je5ImgugtyxKaheQLVKeqHz304+B6rpDqpcTDHtuakwTHk23SYfiEEB74mTTPY5AyXAyc4aFI99aYT5jRimsqCwnO6LWR6Lqpc6KlYPQET16OcfKnGe+HkH77Z/jmmw+onuYRmg6gtSLQ8Y+qrvPiCpgI3EJann1u2xLBXGHFdP+2ZhLpzBPeWFyq9txXrIKKFyl+Av1zHrhpXYfCOaBb/VaFlWoTSXNVCc6EIkNZv6LtCw60=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f2db0b3-5fcc-44ac-c950-08dcf4bf11fc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 06:34:25.9271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hhal4bLrEPiS6z4m0E4OhUVcDnvwcwZjuGEzMCmUpS16UV9aGvuda60rylyFJXI0moMAmFF3J4hTV41Wfwx/WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6532
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_04,2024-10-25_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410250049
X-Proofpoint-GUID: kg1Ou2I5EYwDJXhxTGJVDrSEpzQHoopG
X-Proofpoint-ORIG-GUID: kg1Ou2I5EYwDJXhxTGJVDrSEpzQHoopG

From: Eugene Loh <eugene.loh@oracle.com>

An underlying probe could support all sorts of overlying probes:
  - pid entry
  - pid return
  - pid offset
  - USDT
  - USDT is-enabled

The overlying probes belonging to an underlying probe match the
underlying probe -- except possibly in pid.  So, an underlying
probe loops over its overlying probes, looking for a pid match.

The trampoline would look for only one match.

However, more than one overlying probe might match.  Therefore,
change the loop to keep going even after a match has been found.

Incidentally, it is actually only pid offset probes that could
"collide" with any other overlying probes for a given pid:

-)  pid return probes are implemented with uretprobes
    and so cannot "collide" with any other probes

-)  no two USDT probes -- is-enabled or not -- can map
    to the same underlying probe for any pid

-)  no USDT probe -- is-enabled or not -- can map to
    to the same underlying probe as a pid entry

So, possibly one could optimize the trampoline -- e.g., by adding
BPF code to exit once two matches have been made.

Note that the flag we pass in to dt_cg_tramp_copy_args_from_regs()
should depend on whether the overlying probe is a pid or USDT probe.
We used to check PP_IS_FUNCALL, but the upp could be for both.  So
check the provider for the overlying probe instead.  (A later patch
will move USDT probes to a different mechanism anyhow.)

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c          |  45 +++++-----
 test/unittest/pid/tst.entry_off0.sh | 125 ++++++++++++++++++++++++++++
 2 files changed, 144 insertions(+), 26 deletions(-)
 create mode 100755 test/unittest/pid/tst.entry_off0.sh

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index e0d7da00b..7b5fbfc53 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -754,38 +754,23 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	 *				//     (%r7 = dctx->mst)
 	 *				//     (%r8 = dctx->ctx)
 	 */
-
-	dt_cg_tramp_copy_regs(pcb);
-	if (upp->flags & PP_IS_RETURN)
-		dt_cg_tramp_copy_rval_from_regs(pcb);
-	else
-		dt_cg_tramp_copy_args_from_regs(pcb,
-						!(upp->flags & PP_IS_FUNCALL));
+	dt_cg_tramp_copy_regs(pcb);                            // call this only once for all clauses?
 
 	/*
-	 * Retrieve the PID of the process that caused the probe to fire.
+	 * Hold the PID of the process that caused the probe to fire in %r6.
 	 */
 	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
 	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
+	emit(dlp,  BPF_MOV_REG(BPF_REG_6, BPF_REG_0));
 
 	/*
-	 * Generate a composite conditional clause:
+	 * Loop over overlying probes, calling clauses for those that match:
 	 *
-	 *	if (pid == PID1) {
-	 *		dctx->mst->prid = PRID1;
-	 *		< any number of clause calls >
-	 *		goto exit;
-	 *	} else if (pid == PID2) {
-	 *		dctx->mst->prid = PRID2;
-	 *		< any number of clause calls >
-	 *		goto exit;
-	 *	} else if (pid == ...) {
-	 *		< ... >
-	 *	}
-	 *
-	 * It is valid and safe to use %r0 to hold the pid value because there
-	 * are no assignments to %r0 possible in between the conditional
-	 * statements.
+	 *	for overlying probes (that match except possibly for pid)
+	 *		if (pid matches) {
+	 *			dctx->mst->prid = PRID1;
+	 *			< any number of clause calls >
+	 *		}
 	 */
 	for (pop = dt_list_next(&upp->probes); pop != NULL;
 	     pop = dt_list_next(pop)) {
@@ -800,14 +785,22 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, prp);
 		assert(idp != NULL);
 
+		/*
+		 * Register copies.
+		 */
+		if (upp->flags & PP_IS_RETURN)
+			dt_cg_tramp_copy_rval_from_regs(pcb);
+		else
+			dt_cg_tramp_copy_args_from_regs(pcb,
+			    prp->prov->impl == &dt_pid ? 1 : 0);
+
 		/*
 		 * Check whether this pid-provider probe serves the current
 		 * process, and emit a sequence of clauses for it when it does.
 		 */
-		emit(dlp,  BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, pid, lbl_next));
+		emit(dlp,  BPF_BRANCH_IMM(BPF_JNE, BPF_REG_6, pid, lbl_next));
 		emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_PRID, prp->desc->id), idp);
 		dt_cg_tramp_call_clauses(pcb, prp, DT_ACTIVITY_ACTIVE);
-		emit(dlp,  BPF_JUMP(lbl_exit));
 		emitl(dlp, lbl_next,
 			   BPF_NOP());
 	}
diff --git a/test/unittest/pid/tst.entry_off0.sh b/test/unittest/pid/tst.entry_off0.sh
new file mode 100755
index 000000000..f1a75b6ae
--- /dev/null
+++ b/test/unittest/pid/tst.entry_off0.sh
@@ -0,0 +1,125 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+dtrace=$1
+
+trig=`pwd`/test/triggers/ustack-tst-basic
+
+DIRNAME="$tmpdir/enter_off0.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Run DTrace, dumping all probe functions and names, plus PC, in a.out.
+
+$dtrace $dt_flags -c $trig -n '
+pid$target:a.out::
+{
+	@[probefunc, probename, uregs[R_PC]] = count();
+}
+
+profile:::tick-1s
+{
+	exit(0);
+}' > D.out
+if [ $? -ne 0 ]; then
+	echo ERROR: dtrace
+	cat D.out
+	exit 1
+fi
+
+# Generate the expected list of functions for our trigger program.
+
+echo main > expected.tmp
+echo mycallee >> expected.tmp
+for x in 0 1 2 3 4 5 6 7 8 9 \
+         a b c d e f g h i j k l m n o p q r s t u v w x y z \
+         A B C D E F G H I J K L M N O P Q R S T U V W X Y Z; do
+    echo myfunc_$x >> expected.tmp
+done
+sort expected.tmp > expected.txt
+
+# Check output for probe name "0" or "entry".
+
+awk '$2 == "0" || $2 == "entry"' D.out | awk '
+{
+	fun = $1;
+	prb = $2;
+	PC = $3;
+	cnt = $4;
+}
+
+# Check that the count is 1.
+cnt != 1 {
+	print "ERROR: count is not 1";
+	print;
+	exit(1);
+}
+
+# Check that we have not gotten the same (fun,prb) already.
+prb == "0" && fun in PC0 {
+	print "ERROR: already have offset 0 for this func";
+	print;
+	exit(1);
+}
+prb == "entry" && fun in PCentry {
+	print "ERROR: already have entry for this func";
+	print;
+	exit(1);
+}
+
+# Record the PC.
+prb ==   "0"   { PC0[fun] = PC; }
+prb == "entry" { PCentry[fun] = PC; }
+
+# Do final matchup.
+END {
+	# Walk functions for the offset-0 probes.
+	for (fun in PC0) {
+		# Make sure each offset-0 probe has a matching entry probe.
+		if (!(fun in PCentry)) {
+			print "ERROR: func", fun, "has offset-0 but no entry";
+			exit(1);
+		}
+
+		# Make sure the matching probes report the same PC.
+		if (PC0[fun] != PCentry[fun]) {
+			print "ERROR: func", fun, "has mismatching PCs for offset-0 and entry:", PC0[fun], PCentry[fun];
+			exit(1);
+		}
+
+		# Dump the function name and delete these entries.
+		print fun;
+		delete PC0[fun];
+		delete PCentry[fun];
+	}
+
+	# Check if there are any leftover entry probes.
+	for (fun in PCentry) {
+		print "ERROR: func", fun, "has entry but no offset-0";
+		exit(1);
+	}
+}
+' | sort > awk.out
+
+# Report any problems.
+
+if ! diff -q awk.out expected.txt; then
+	echo ERROR: diff failure
+	echo ==== function list
+	cat awk.out
+	echo ==== expected function list
+	cat expected.txt
+	echo ==== diff
+	diff awk.out expected.txt
+	echo ==== DTrace output
+	cat D.out
+	exit 1
+fi
+
+echo success
+exit 0
-- 
2.43.5

