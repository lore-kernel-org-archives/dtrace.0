Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C9B1DFEB
	for <dtrace@lists.linux.dev>; Fri,  7 Jun 2024 18:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717785728; cv=fail; b=Z/YMdqr7WWrHD+kI8eLNFth0LLeQxROaX13fdFVDnkzx03A3qRVQsr999yZufUNmSF1yMfM2GuQpX/GcsjIc5pxL6uSM6dhU4rCgtRODu+00RZvOOIh0E6vU0Yk9Fl7eVbW+mrkBV4GL/n0JXpB+M3o851Fr3LDmBV9OUoLctwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717785728; c=relaxed/simple;
	bh=wzwwSMS1PHszqLHHIJum6YZL25N3d9ZX2Ct8p/yT7j4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FrizGWXo/mVl3W8+T7bZC9NEvhKK9o9OUYFpxltn0jyUxf3NJ3SI9166ItqtBo0H3on0PTFwcKbcUiWUZrkVg+u0do/6GBq3mIJdX8VgIfFe9BcicSt2w9xbE/RX/foLepYYZFEy7/KYQDsCxJ9LggJuDL1NqDV8s1AxvVEXavE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jTLoFZct; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qIBrGt52; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jTLoFZct";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qIBrGt52"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 457CuU6B023591
	for <dtrace@lists.linux.dev>; Fri, 7 Jun 2024 18:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=corp-2023-11-20;
 bh=7EMJz91AYljFUS6Cq5A/kpqoHvf0BgWKIle6vFsIhKw=;
 b=jTLoFZctP6pTdyosVMzvn7gBuwxr3uWWREX9XLS7jjC1nDIFJgiGBZIVMeRv5fAJvVzl
 5+YOtqEbpt2TEIAd256dnQo8G2YSU058B0yymNpHFEpuSyFqH81Xrw+FEB2CdsGYcB7X
 5qsUSewqZyCK+daBI5UTN4pqwMLEmIoghrUNtMGH9HvwDuOySb4m757SlHlKD7A1hcuN
 rtl1OL5cyha1oPf4TGSwxYV884zRMePcIdUZFBmyHKFZp0Ptx1ZFp5CJrOe1gV866hwK
 p0aAWsp66YeVB1aqib+db7wf8cyEjyGe2FmQawnfj8hnqzqnesBlTu8rmU7OalhFhxWL zQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yjbrse528-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Jun 2024 18:42:05 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 457I4uCg015566
	for <dtrace@lists.linux.dev>; Fri, 7 Jun 2024 18:42:04 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrjh03ua-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Jun 2024 18:42:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWiCFEO3IUXkiMtJQhR90bv001D8A+nP3AoCA/FzC1wX5wvg9VGYcxEkdPzEfV+YoaZtjOeBLT4Ze9FCXlkTFTDKbDzLbsNAp2535bPJ0qGxdk+JCk4bWHJ6b2EgYlGLd3N/QqTp7LUw5QTYNmWui5WjVtV/ggcPKzjXxwZgass+YxtgwBq78X7aZVjjw7Nx319ImzwttuQ5PXxX/bzQDjybQs2WPSu+SMsONoyMZGSferXdyiraVJjCGIKeNT++GRW1XgqCTDG+u1ITnJ9HbV/J/+879upOWQduiJsvPLlutoCaZwWGWU3WSM8DZniQLoOWlYy5u5tjK0vh3qge9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7EMJz91AYljFUS6Cq5A/kpqoHvf0BgWKIle6vFsIhKw=;
 b=oc6jKonhfDpQriVhctMfXWkrtkORnnVe5tGuWEpAoL25TqeTtk1a3afPBZ7UgwE7sVnJZQqtkjOSCCqnzpKxb4DVZ7yRDxkHcprVB2z1jjCgq0KaNAAGyMLW+JL1oJ7k2VK+jYXEPSbDb8lnc6bHCrY5UNjRtfGpDpC/pdhhu4+wYKxKZi99ZbhDHLT/XEKAEVupcNOL/uG+824QjrmxoJ1kgqdAw6xW686ACys0gu3HeChcZuT9+TQYoi91KonvVLkc/j7JHj5o0Mwk0O+8P9oHT2NnyUvdrzRkQ7WKXrYaWd2AK+w2o7Bbs0RYGXztrWKgZp8Xc921bSNrUp3FFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7EMJz91AYljFUS6Cq5A/kpqoHvf0BgWKIle6vFsIhKw=;
 b=qIBrGt52IbnhlpXYICxKXyQMaeov8s9PuHtJGDEKRNTqOe2Yn40sHkfMbgERMUfXAeCIYTdOvK9WHZtZuGbWcVn8RhfnItkbk9uXrr8Rh8C9bKRKws23hihUo4xp9eRBITIGEml5ys+FCAV7COIGWzyqZaA9sqKnfFqqJwEHMcE=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by SJ0PR10MB5615.namprd10.prod.outlook.com (2603:10b6:a03:3d8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Fri, 7 Jun
 2024 18:42:01 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.7633.018; Fri, 7 Jun 2024
 18:42:01 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: kris.van.hees@oracle.com
Subject: [PATCH v2 1/2] translators: support 6.10
Date: Fri,  7 Jun 2024 19:41:54 +0100
Message-ID: <20240607184155.316904-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.45.1.275.g567cb0950c
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0013.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::20) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|SJ0PR10MB5615:EE_
X-MS-Office365-Filtering-Correlation-Id: e9f61f32-f241-4759-74ab-08dc872184ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Q+rWpf/oaULeEwtc9xVU8zGR8ZR4LWvSh82igO0aJL8s/QYmoB+futm8q0Az?=
 =?us-ascii?Q?WD+10eijetQriONPYq2NM/MR4VIq8BTPReYVwYgSFgFMbXXZ4bBES+uAq0zW?=
 =?us-ascii?Q?gSE486NvwhbnRMFulCDSlaKZzhpn+40ZQJ8blICQx/jxrYfJA0/hI7Uw5UEf?=
 =?us-ascii?Q?NzPRHb2qb3HZSJgGtg1RhahdruY7chTDiVjiD4xKB6wW+Q34mcoAC1LFCxGs?=
 =?us-ascii?Q?GE8u+s06pDQVm7B2R8THr42uCrStNcUS/rEqiWrEc/pIQ6nOhjWRDacKE3m7?=
 =?us-ascii?Q?OnoDFwmmrNXU/oX/f7mwg7UwNb7Mr7o5369ld1jNCjnqCMsZNNmqLqEuOlNK?=
 =?us-ascii?Q?w5MCOHY3JGXnoS7tz29AjCfD79t69B0S5w5PNmPqeufhXwFDz8NAYubPtZp5?=
 =?us-ascii?Q?ouoNXeEGvPqYRtyLcVzQIk0sHLtMxgj5RVVmMNOWBcyThFWhEspDNQ7nXnKr?=
 =?us-ascii?Q?6gWpD9ue5uNHHdSdIMC0Sj5bk/sCQmkvKQ4NI2taB1NwarC7GAeY7LTN0V2x?=
 =?us-ascii?Q?EczPmkkusrqURTdU4AO3+LWhjZAapGSYH4JOJO4/qGrVJieMYw2jDwh7XXAY?=
 =?us-ascii?Q?RD0Ntql5SodhOBdie9BzeJjsOfs7ct83yWd5nCgW+LpgpjwTi/SyYJ4lLCeE?=
 =?us-ascii?Q?MKtr/99QB2zsocElDKsiKR1N3wXNhuB3nPDMEx094Cdz74nFm6wbZiSzTHdO?=
 =?us-ascii?Q?sAj1W8dshkP0ouyX0SOne+pcBhLzMtyxK62pLfQrYLASjUuNf846VI8oqjVB?=
 =?us-ascii?Q?1URqtbd2XEhORZ9kEoc20gIVYCLr2imEgLLpNOC3UG3KS+q176sZhl9qkCyC?=
 =?us-ascii?Q?yerTq54FUWHdH4rHmTv3bDdDgGMYpurhiFvCj2LeifY+pC6tpkIwz2Y3Vf38?=
 =?us-ascii?Q?BKoJ5guUS0CqAAqKz0uW+a6PdkznuEWEGQ/R7j2r0AX+DVOOVUduLclgCabr?=
 =?us-ascii?Q?/DnZnoV+iDFaUw1BuwHe/6TfYvqkrCAFWHDFxDGbje/I6tDZDELZF7yJjMjA?=
 =?us-ascii?Q?pLToWFfzwfBskLohros+GeZSwyLgIRvvXIl+VJXpy3FNIBpq3OUtqVrKBowU?=
 =?us-ascii?Q?HPNuWHjeT7Z8u9lbqNX7qsSWTnZNjLMSTSAGunlwD+wko6Bj4dEp35LgqfUR?=
 =?us-ascii?Q?oYuHRsjzy0LX1pFN7PR2jYaZGHoBZ0rErWf9awABTcjid+LpPsV/rC7aZJR8?=
 =?us-ascii?Q?lbtUPOMmvQX+FU0NxdmStyuaGqO/oRmQcozDNoIjJBRrGId2dXKBjKsNlR34?=
 =?us-ascii?Q?KA7bjVgthGa3zsy9Epj3hJCkKZC1c2ZwNhEMcO1fHaCz3jF9De2cLmmEiUnh?=
 =?us-ascii?Q?k5baj7NLVNiP7/twMzdYg+R6?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CsM1dTaUUFt6Z6z4ZfdpsAO6vx4PiRpBIKiQMrwjyXW1b6vukcnIEpmtMAIN?=
 =?us-ascii?Q?qfn9/AbZtnigj0FlnBiobq6Z15VcmIb9D35nt8CUQinUWSxOcrkwZy1ncG3y?=
 =?us-ascii?Q?RiNKT39mOlcC9H+58crX7dSX6/0yDP0He9DtVTqibp+728XvOujdgcnanf7G?=
 =?us-ascii?Q?SxMriYsoV2yukSIs04Y/gTwE53r7DPeBbvL7locR0JnvtU8Syg0wJaB/Cx0E?=
 =?us-ascii?Q?TUz+FWGSeWVumebR3Ly9l8oLXtnRzZNxc9P+CmwcuqO974whHzAxf+Cn2LS6?=
 =?us-ascii?Q?83h3oDUach0UVBQy0laI5VPmUbjc6lGu+7Ye09zeQrSlrwFE/3kDfUhlGzks?=
 =?us-ascii?Q?WnK3EewI5kh0eepQ/WXDVFqx6YxeCvqzhyyOh6iec61hDS7bofU20kcFtMEn?=
 =?us-ascii?Q?F6Yhso0VrgT1/TPuJQ7ZStfcmDFasiHEW+I1labX+wPMemc/FA1w1Idz9HgG?=
 =?us-ascii?Q?fv98AeFc0RIU5LS4SBIp2gmjfwX14w7dtaUKBT5mEpYcsn8Ln0em3BVLLWJS?=
 =?us-ascii?Q?LmYrZEvVCwn1+yB8ZbtiVbL/pqdFpIYU9UwXH3IpVmx7kExxl4OvhoRHUzxQ?=
 =?us-ascii?Q?hNui0+YAh997h9H0LjJArXAlg18nEAepfeYrY5XNxYGUhzRCySdDAKKU3r/S?=
 =?us-ascii?Q?unmdxsx68htBOBukTVmB3G2xmOxkVdsW/KjcWT/KuY9p8Vm/RczjpqBjtRcs?=
 =?us-ascii?Q?QEglyShxHTu1hFX57J72TkNlORdYgGtkNPUaB+jq1upC9HZ3lcyCJsuVkupY?=
 =?us-ascii?Q?u5X7KeYNdWoJaWgZT4fF1adNwG1o9l5478CkYc8EQ3ouHXWI6OUV7FOiCr/+?=
 =?us-ascii?Q?LftxdUBG+CeqBfqOjrm7DMAgSjp5KFRtrpSzddYd3sKe03q5Q2KWAGhq+pTx?=
 =?us-ascii?Q?Zu89QhALsrvvam+rj/TESaSMstSnnRSm6Qp+VW7NGSEA6CFO+Zd0PMCsZ5S3?=
 =?us-ascii?Q?+01svPX1id8YKzJKGI8kkZx/pDA+cl70P88W1esQPhcAKFCGD8rHM1Ul4rBr?=
 =?us-ascii?Q?VbOgz/1NExymOCnI7r/uIF/zTlbfXjAVyEpEURRTVqwwh1k+21RF4BZqQy2+?=
 =?us-ascii?Q?jnNCi40DZ3sg1Y5AB8xPVY4AXt8CZXzvPXhd6ZXeD2HIOBGzWTL+94mw7baz?=
 =?us-ascii?Q?11JMVR0IfRswftR4UO9zcrQJaayPtoNy69IH5XbhK48CmOucyj+DcQ6YHCMH?=
 =?us-ascii?Q?gSu8/7Dol3fXpCp0kfXNjgm2aXW7biPdyxujCp1WQwrpWn+ZkSDwtyS0iWSc?=
 =?us-ascii?Q?WHJjZBzSSGuk7mdWREHYPp379whAqxjw1zLN9jgIyfuygV6WSib9BMRGPQWg?=
 =?us-ascii?Q?hzUuQQ42pSCYaXua1ImgnqVq81yJjUKFG9sQzC6/O9tVNL2VaIMutVizurhW?=
 =?us-ascii?Q?Xgr3La+ulWPF7szN16JMg/XL9vUkDPMW7OQl/IpT9XNvVQmvL101EXRx/pb5?=
 =?us-ascii?Q?1hg9ZfBXoKIFoUtBoRLoDBpY7c1r8ie6Aj2TJXIG7rAfEIOJuIETWYcW5XaC?=
 =?us-ascii?Q?PITzv59VS1Ravy2VHvTY3O0/uTtYutXKkXeoc+KjMhcupED0lW6cDuZoxck9?=
 =?us-ascii?Q?uFaJqVB2JCXQnGCxKGIU5Cn9jHaYki3I8UwvGY3WjKJ43jDwzpoIczDh7kJm?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	hzj+ccmFYwYYMPE48Ep2fe4vzS5aJdsAZiwKuahV2nTouVe4CPH0wpJNxJqDNptPwAQ1PV7b94lMo1ly/XNdu6at4gER82xUcXOw7Ij5u8cuAY851mqV5lR7kTCn4QTgPunxQmjwTmjFOMlTRchntAzyb0KktibSyVzs6NbbBNec3Dx4CZiZQkIl94MLSQ+Ro/PJxEnpoYP1MFVD8loEaoB9hYQjrZe/QWk7jOEsrYaQ+iewnRc8W/sB26Yc6rVbGu1jJuORQZ745052stLYIXRtBI1RUaOeWJpso9Nzs8t/77YBgb2ALSqd2oHPxtUNETX2yHjidxx7H9vjZ0RUOza+SKlFJrCc0OqALOUr+0D6UfVpgepuLFFAE31Tn8jNIJ7ZKxCqIuKoEfzd8qEb8Fy2+zKz9op3rWQzCDrZSnWv4JVE9vAEmSjAyeNPGL2igpmBKIbcqqbtqq9vz4vk3uHf8zuaFw5xAMcI7CTbBf7ilkhrpL1ABOSfpt38SSjimbjnd1ZBa1V7tchmvgzR6nngIadc2dWtTiQKEQ+m3Hry6LFA2PC2hjk9EbQFKFLCTWMawsS9/S3jxQuunl+n2I56YbVrJkm7CHJbyEtDPqY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f61f32-f241-4759-74ab-08dc872184ee
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 18:42:01.5903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lhc//X8aWQFkNFC2zjYcYNQpGDHyQVzZeOgHBDw+j9faSCeX3G8zYYLPU9bn3Lh7FtONIeF7hti3SUNUbsTeNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5615
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_11,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406070136
X-Proofpoint-ORIG-GUID: yXeGyMWZI8bVzKv0UB6aMRrZJ4RoNR3K
X-Proofpoint-GUID: yXeGyMWZI8bVzKv0UB6aMRrZJ4RoNR3K

This changed the block device into a component of an atomic
flags word (so we need to change the .d.in as well to pull in
the releavnt #define for the blockdev portion of that flags word).

See kernel commit 1116b9fa15c09748ae05d2365a305fa22671eb1e.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/io.d.in | 6 +++---
 libdtrace/io.m4   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/libdtrace/io.d.in b/libdtrace/io.d.in
index b3da517778264..f44f53f092dce 100644
--- a/libdtrace/io.d.in
+++ b/libdtrace/io.d.in
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2012, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2012, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -69,7 +69,7 @@ inline int REQ_SYNC = REQ_SYNC_VAL;
 define_for_kernel([[__bi_rw]], [[(m4_kver(4,8,0), [[bi_opf]])]], [[bi_rw]])
 define_for_kernel([[__disk]], [[(m4_kver(5,12,0), [[bi_bdev->bd_disk]]), (m4_kver(4,14,0), [[bi_disk]])]], [[bi_bdev->bd_disk]])
 define_for_kernel([[__disk_chk]], [[(m4_kver(5,12,0), [[bi_bdev]]), (m4_kver(4,14,0), [[bi_disk]])]], [[bi_bdev]])
-define_for_kernel([[__bio_partno]], [[(m4_kver(5,12,0), [[bi_bdev->bd_partno]]), (m4_kver(4,14,0), [[bi_partno]])]], [[bi_bdev->bd_part->partno]])
+define_for_kernel([[__bio_partno]], [[(m4_kver(6,10,0), [[bi_bdev->__bd_flags.counter & BD_PARTNO]]), (m4_kver(5,12,0), [[bi_bdev->bd_partno]]), (m4_kver(4,14,0), [[bi_partno]])]], [[bi_bdev->bd_part->partno]])
 define_for_kernel([[__bio_part_dev]], [[(m4_kver(5,12,0), [[bi_bdev->bd_dev]]), (m4_kver(5,11,0), [[bi_disk->part_tbl->part[B->bi_partno]->bd_dev]]), (m4_kver(4,14,0), [[bi_disk->part_tbl->part[B->bi_partno]->__dev.devt]])]], [[bi_bdev->bd_part->__dev.devt]])
 
 #pragma D binding "1.6.3" translator
@@ -98,7 +98,7 @@ typedef struct devinfo {
 } devinfo_t;
 
 define_for_kernel([[__bh_bdev_dev]], [[(m4_kver(5,11,0), [[b_bdev->bd_disk->part0->bd_device]])]], [[b_bdev->bd_disk->part0.__dev]])
-define_for_kernel([[__bdev_partno]], [[(m4_kver(5,11,0), [[bd_partno]])]], [[bd_part->partno]])
+define_for_kernel([[__bdev_partno]], [[(m4_kver(6,10,0), [[__bd_flags.counter & BD_PARTNO]]), (m4_kver(5,11,0), [[bd_partno]])]], [[bd_part->partno]])
 #pragma D binding "1.0" translator
 translator devinfo_t < struct buffer_head *B > {
 	dev_major = getmajor(B->b_bdev->bd_dev);
diff --git a/libdtrace/io.m4 b/libdtrace/io.m4
index e837ef65b86f7..aa406ec375698 100644
--- a/libdtrace/io.m4
+++ b/libdtrace/io.m4
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2005, 2013, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2005, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -11,7 +11,7 @@
  * to replace those tokens with their values to create the finished io.d.
  */
 
-/* #include <linux/buffer_head.h> */
+#include <linux/blk_types.h>
 #include <sys/file.h>
 #if 0
 #ifndef __USE_UNIX98
@@ -43,4 +43,5 @@ DEF_REPLACE(O_NOFOLLOW)
 DEF_REPLACE(O_CLOEXEC)
 DEF_REPLACE(O_DSYNC)
 DEF_REPLACE(O_RSYNC)
+DEF_REPLACE(BD_PARTNO)
 #include "io.platform.m4"

base-commit: 454c6d47bf408415f7eb52ea701779f041aa6957
-- 
2.45.1.275.g567cb0950c

