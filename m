Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223D110E3
	for <dtrace@lists.linux.dev>; Thu, 13 Mar 2025 00:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741826397; cv=fail; b=TIDudR0FliT5+zMWIXAPQuQojooonD5Up0qAP4m/+wpwc+pl5SH7m7v1ieRu9u5kisK0ZJB3T3gSLZfi7sChiqBqjeRW9klxFfKVY/UNb0ZR1yuSnPlYj5ZFlcWXc7HB8EN6q7v6AfviUbNGKZux34xWgTVVPBCpwfEE/fB9UJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741826397; c=relaxed/simple;
	bh=5iYdcgoB4hFh/L5iHVDPr2EFonzqmJbKZez6naZep8I=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=DoXsaDhYbkDlxkB/u3LkEoKp+syeafoaBor584g8UAFRuRrFQveOFpdo/xHONZo2Ef41VvjIlysR8zeTfoeSfzDMnD6oTgNXd92vrgH6jwLOtcKUCbB8UKvu626iqYPTCJlD+oL9NJe9G6UmjtJqveGHNu0unXBcwN3sGbrGPu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IYMIaqFt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XfWEeLey; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IYMIaqFt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XfWEeLey"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D0Bo8e030436
	for <dtrace@lists.linux.dev>; Thu, 13 Mar 2025 00:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=5foNalWRyeB8F4ebI1jQj2EUxSBv7mGOL6B3GVouseI=; b=
	IYMIaqFtkOOeDxVXA9DBTaTX5eNMcigRcHxPssqTLq42dZKppouln/O4Lt3gdJwp
	ysSL5Agb3KKEzbJvjDEw9pcuQCimVIuJKp7vK/x+EgYxOFEl6oRES2KSAda7LLVr
	r83XmbpCOuLUFaU+6I9mp140OmsDgzSS7Drg2zjWVhboRMoAiyBlFlqOsL31iaH5
	v5waebbtDMVQqFHnXjtxLUvto0SytMG6bDJKKAEpBS7D/jTILI6ChNR/hKpLunCt
	MpHWcpdL/x2a3Exg4yGMerW+JRKEIBkQdECgHI0BcUvTFBXoLkc+58TMzNIktR2s
	utqYH05f4r5sVW3McxfV8w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45au4du32v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 13 Mar 2025 00:39:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52D0CYk1003844
	for <dtrace@lists.linux.dev>; Thu, 13 Mar 2025 00:39:53 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2049.outbound.protection.outlook.com [104.47.57.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45atn1fmep-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 13 Mar 2025 00:39:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=owR1aoqPqUhsQKSI2CtD7GVLfgNENH46dkIl3rr4wXR5fjLna+M4ZjsJPsKGENAT0ZUEBegXrypZBoB6YO+6c55nJKVM0AovA0YrpTDBDcXIctqIYiDxaAK/EFILyDlqTqmAGFCXsX8M0JvAH12IAPojRzliwZgbVB6IVQTGobI6EclscvKx07fIAewMVkkeLrj019F1gu746VdmfmVuKj3UDMp+adjx6Tmz+ZVviHjC5mU2T4CtZQgk81mPwFkVoE8dvEYpNf+kDL1sKWhX4a4GQrrNWTkUlVmZsenvpY7Dmdb36frEXgeho3Cv/KRrtVRMJsYa9ukqPO4tEY16hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5foNalWRyeB8F4ebI1jQj2EUxSBv7mGOL6B3GVouseI=;
 b=NIa3gZUIMqh7OQ/1EuWXn6D4apoTKcAZG0U1D32z9a90OBK4Nx3pMT89ykUq3fhnX6cMQjuxZxC6Wusj0VCMPLYcguOUNDLPLrvxfJhM+lFqikRc3nXnGG8NbqA7fNLSGrzSzA7jarvErnD7PbfdYoYs4ekgOIiiOUyurRD+pNuk+UPo0bj4Mip7vk5Fw7f/KiA/qBRL4X0IVhN9gJxQWY9IF9URSgb0NnqXqsk5TgVWfstPZ2uC6ry9amhLu/hzJcHzMighA+1tbtNVrdn745wz7Y73tcIve4IDKdqqVgMpCGz8+Az+NI5NCiOsqLmj5hoZ0zcx3FV2NmL16ur20w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5foNalWRyeB8F4ebI1jQj2EUxSBv7mGOL6B3GVouseI=;
 b=XfWEeLeyczzVm+VoicSmBFey5NqsfiECbeXdwRaZGiuXbRmoJkeErTBztCCgqQJ3+zw4sP+yNWGBjG5GHDsPBeMxeBibAH1v+cqc0gfHD2k69Na2bcDc98T44xprTggiayVwhLsR4e9yVNfKrSxNZWTF8djpLKP9jVOOEdwzIdQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH2PR10MB4230.namprd10.prod.outlook.com (2603:10b6:610:a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Thu, 13 Mar
 2025 00:39:50 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 00:39:50 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Make tests more resilient to different prid widths
Date: Wed, 12 Mar 2025 20:39:46 -0400
Message-Id: <20250313003946.11074-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0032.namprd20.prod.outlook.com
 (2603:10b6:208:e8::45) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH2PR10MB4230:EE_
X-MS-Office365-Filtering-Correlation-Id: 2de9c988-7457-4cc1-8963-08dd61c79004
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZS/B0iuZpVBbkNtdOKu8XRDB8cZKPi/AcV25LTSynTNeOHL+lFiBwaOCbkUz?=
 =?us-ascii?Q?w5LTXKtC2HVYALQJN/d2yGYjnYxy0RKn8wACGbTOj2uHvxcMiODIKrZiWX2V?=
 =?us-ascii?Q?FQlMHAV1rui3ZrV7/mb2utFuO8v1hFj1j6A04olT8bTk3v7gUU7sPntagIX9?=
 =?us-ascii?Q?NUov+OxCmpK7oiRrEirrAW6Ieg5jKHLBIX3B8ySOX0ry0NxwacRyGCywp0Ux?=
 =?us-ascii?Q?u0XnSMbF/5KDx1nm3arPw2nAnJDjWC/oG77r/19fLHJjlaxIDj7Mzzf3c9ru?=
 =?us-ascii?Q?ZE2azEq/vsUjonDCoHBTklZJiy+sDMk8d7Nxt+6pBOPR6IbmVt50VZa99IcH?=
 =?us-ascii?Q?05gYjKdkGMw98pcO/t45hsRXoUMr6nJsJyyf4+EGf686c3D/kDmGZgSNPIL9?=
 =?us-ascii?Q?zE18H9t+ylZt/cHQyU0qbi+vmNc0SBDbxIjXcC1/QiUxfGsU961TkIXOlM7G?=
 =?us-ascii?Q?EkJhkyrbAFokDj13WZTS6wTnSkMR7lbitpQkBxZaHa2l39KCkdYBf8i3VcqB?=
 =?us-ascii?Q?VVorzAJRyJYBuKrpsRBknkasMO7HWhjPyHCBRyXYosN5KD1IrKl7O/ZXzd79?=
 =?us-ascii?Q?5chR3iBl/5+H+PPf9sQEcqIHjuckgo5cGYOt/FTM9khy+pLlAGSuS/HTRauj?=
 =?us-ascii?Q?WZHDA/nJ/Cwc7k5NzAMTWVJ0wYt23S4hOOrU9zgPuGO71P44EuP6p6QXdzbF?=
 =?us-ascii?Q?N4keVvR+cvjywZZ/23X6a39m95iHfWqICJTY4UBgorB5OXHiEqJIMJgL25Fd?=
 =?us-ascii?Q?D3I2kf0uY9ZGIEm7+nTyeAlZmBZWj/AhPRqSgVXAmnUaOMFImN09C7EbrZj1?=
 =?us-ascii?Q?cpe2zBHbxDzUI7/bSRLBTBamKYIuMJTfwjXIzzNy0a6Oi4Jg9FmE51fOWVsF?=
 =?us-ascii?Q?/69WBHHJM6o+O+QiSbb1XavHui0f6wTDfkqLKq7QLkWBGQsGk3iTCH22VuWD?=
 =?us-ascii?Q?zskNE2Wm26A+KsTQzBrIkgKyeEUc5b0OMNMzroqFJwGN7IivCD/O5ZRWsuw3?=
 =?us-ascii?Q?ssno7ijgYymlUlIy/X/Sm4HtTSphj4eW8IlzGybLz5G4Ksba3hPEIwA6ukqO?=
 =?us-ascii?Q?yOZ2WRsM9Eq3DKegyBqQ7p6qdO6FHzQ+JakFM6Oz0bKnYAesliFYuL+1aMRQ?=
 =?us-ascii?Q?POKRBYbvWoUpuyH9JAxNodkVzXDwwnayfW6E5DBm2jUU0w7jtYum75hHQTGt?=
 =?us-ascii?Q?hf7uPuSLms5boRepSGOwkWA9xAq2hO2ww8aYffh7bjSU7hKlU6QBMebhdG7c?=
 =?us-ascii?Q?3Q8VIGJfrBCAEGPmPrNI8uDVdv21qiEVOtd9AU9d2fYlwzy/h/HbhuWkF+hb?=
 =?us-ascii?Q?hZOBV4YbqtveR09+F12z1ZYB2TCa5xvlTrd48H0fVBjWufU7HsnxcbNLExw8?=
 =?us-ascii?Q?V+xTd0GWWI6Hj0kY+W167arMLlxE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7ZZoeHjcSoeCtVwbvILSSHD7ZfUIDA6olTkh8uWKc1XVAASy4bVLq7BVm6oh?=
 =?us-ascii?Q?+f4Eeld8sL0fnWvb0Fce67yFHHREifkyCtYkExB7fqoF0Kf2gZfpFnsLrKWe?=
 =?us-ascii?Q?JOsrb3GvK69dfR1gTJx3OBWHFDhr31xQwtvzQf4l59RvZ6Y7tNjCyuJaaIqp?=
 =?us-ascii?Q?W1Itj2S8ZlTfyaygT7QY4ty+jpms6Dr4QMi2l0y+MDB13HUbmhANSX5bCLbE?=
 =?us-ascii?Q?onOKsAq8VYhdPuJdff8KZig64Q263/dmqURpOR1hKUNpMUoQc9ippU9C0RXn?=
 =?us-ascii?Q?gwKlUZvuVoFQnd3bw82WfXz/Ab4q4yfbhhuP78SIZ1HXPT8kc9Cqyo6o0fgM?=
 =?us-ascii?Q?UlgXzU54A+66q04igKoaZffC9Qx1pHq5bLVDkUutXDO1AjIXPMK1jRmVtYT6?=
 =?us-ascii?Q?h1fCL5u0h9W1OkkFkkSEoAEzlc5BvZpgNXGsjpXl4kuogaOzioG1BKwygbNS?=
 =?us-ascii?Q?2DTXLM6IRxrdM+Uc6htrHTfitaMuQ6GgGj7DAfl99fHLuTQUAWVFZULoNhtm?=
 =?us-ascii?Q?XnSsMqdutH2CVskVey21mX7Qb2lqD2EzUKtRcQEtoHUVVJ+VClfWFmnLcvdq?=
 =?us-ascii?Q?vyxP9RmXTSYES5WceQMNTiUTt59gL5CWdDKBFssV8vmY/3U352JegdUsnvsP?=
 =?us-ascii?Q?TGD75k3KCB7k6dQU8HaierJZEhygQNEIzyJPyMc6NwziYF3lHxtgAIlxZNVV?=
 =?us-ascii?Q?RGkHr8pMsQ8Uk3JG3ALNTA99kMwIb0kx2vc8wlY9rejt848rm40eURMufBC1?=
 =?us-ascii?Q?sIW8Oy5ZdRYWONw697xINJ0DTvsI/+Peft8SzSq5sG4UDmV9qra2TuYRW3zQ?=
 =?us-ascii?Q?VUwfhB+U90HRWEDtW+gIv2r8ztM5cZvxJr1lInovNs0jknS6lSj171SFIQMS?=
 =?us-ascii?Q?5Vjr+B0h4QNiXTOhrKhxxMwN98CXaNsejV7TKRTrWyxrzt0MLfGcdjwq7tOc?=
 =?us-ascii?Q?og1m86uCT/JKtfvYGbJL6DIQfHHV8vzpqpKeyjgCITe29HHy9EONjk8+Iq2x?=
 =?us-ascii?Q?2yDJ2zgILFCaNEWiz0hJAu8ExtyOPzJQDhFyqOwVcjwyowHOoqJA4W/GZPoX?=
 =?us-ascii?Q?qdNUJb3qM/x1ZemtvXbwNDuWkck3Iz2ynPHEUuwMi7kgt7TpkteSvBZh92G8?=
 =?us-ascii?Q?PeDTshmHlqixizDAH0MF/xn0EtfWn4+5rMhj+3PBfmhS6eKdKjbO8/w4DenX?=
 =?us-ascii?Q?jyKkgE3DTTdJyregjEFpyFLF7kzM+PczueidfRoEawj6F/an8W+MK/+/pSTz?=
 =?us-ascii?Q?iFqF+BoB2nIk6jo5zURM1Rdicfsq1t+iw4RJW9ILSCf7D1fr19xj3imCCkQh?=
 =?us-ascii?Q?vl2b+mFL6w/aU850QfaZOT1wA76pe+Cx3xQdrPgTJUW28sM0VH8++jtUU3vh?=
 =?us-ascii?Q?nQ1azCA2Ph2XTjszpnWqQ0V9A554fKYBP0r5Ny/7SQL9pZvR7/5SUMfiPxsQ?=
 =?us-ascii?Q?kTMxzSMWO/Bbmpae5PKGxyjI6H4St0Xi7Pi4wgUpjvDcuaBu474CxUHL6m3J?=
 =?us-ascii?Q?MS1+Ezg+8yaXZTLGQBl5WWBdpRrVeMQ3Ivr4pFO5mo3n4qQJ9cPZCG5UKgif?=
 =?us-ascii?Q?oVyAbzgLR/YbyUBc5Nv8nPeBc+9pGW0JGMpi+sFB?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FmjUA0BQtd2oIEZART0YZ3BMUUOUbxdUs8AgmaMpUJmaxWTMfjdt5JZO/VkgDa7vT8meyAHundwxTajflCYlQdzYKEU6tCaAy7tKKn+7rnE2gH+fVRptyVNifsxOMqRqWEcIZUK9tWE5MaKuldxR37jPyGXObvqIEWg1vii/P2+gTPqHtrEcfm2T46GTKqIds6sRU+8RtELYCnbyysmrsAz+yocx0+ePayNlSgU9/w7PThVHuPuxm+1OFBdWMDFELIApzvRa0+CamSAjTvQ6tr0BOOSo91yRmskhslqIy9b4CfsK3v9otjFx/GW9f9Py38A5XOHsmc/LE2Y/v6k9fBN6kwt0/LI7NiWIeYBCPJXeZxJ+0S+b2iJR9Rv1hzGzNj9JUfbFfQxja0MWNVlbfBdycMD/gI7OTXLnKl2L1FmQUw0iF97ylc77zckvPihcm3wePbUyuLAAO8fUE0SFVwk2/Rf99fW+hrBF0NJtfW+ZgZ0kZtMrkr7zyv4QW8TI32unBBzQBm7jLA/+2g9DQTboNtKTTpOqLwEqOu1qezAKj2CvgPOMumTgeThSiHfQlALGIjO5ETfLJXIoF7D7JjfFJGNchAE38UQnXehIucY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de9c988-7457-4cc1-8963-08dd61c79004
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 00:39:50.0992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8UqLy7fQnjYA8Z4TcJbWEmcSNDx2Xz1RsVq22Yp0pG3cOPjCfXltn8/DCwLLbgpDDJu95WrkGOoGpAX0wOiycA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4230
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_06,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2503130003
X-Proofpoint-GUID: Mrsw1oTCxzLXVYE4-9C4T6b9U_EkEO7U
X-Proofpoint-ORIG-GUID: Mrsw1oTCxzLXVYE4-9C4T6b9U_EkEO7U

From: Eugene Loh <eugene.loh@oracle.com>

Various tests convert run-dependent values -- like PIDs and probe IDs
-- to run-independent strings before checking against their .r results
files.  But the conversions could be remarkably sensitive to the width
of probe IDs.  E.g., some conversions assumed probe IDs were flush with
the beginning of the line, but if they were narrower they were preceded
by white space and were not detected.  This will be important in up-coming
fbt work, where probe IDs for fbt probes can be much lower in value
(fewer digits).

Also, these conversions were being carried out by a hodgepodge of scripts
-- sed, awk, and grep;  some using run-independent strings like "NNN" or
"XXXX" instead of more informative "PID" and "PRID" strings;  some
incorrectly using "PID" for PRIDs, etc.

Replace these .r.p postprocessing scripts with a single script that is
more resilient to PRID widths and is commented.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/convert_PID_and_PRID.awk   | 20 +++++++++++++++++
 test/unittest/usdt/err.argmap-null.r          |  2 +-
 test/unittest/usdt/err.argmap-null.r.p        |  3 +--
 test/unittest/usdt/tst.dlclose1.r             |  8 +++----
 test/unittest/usdt/tst.dlclose1.r.p           | 13 +----------
 test/unittest/usdt/tst.enable_pid.r           | 22 +++++++++----------
 test/unittest/usdt/tst.enable_pid.r.p         |  8 +------
 test/unittest/usdt/tst.exec-dof-replacement.r |  2 +-
 .../usdt/tst.exec-dof-replacement.r.p         |  3 +--
 .../usdt/tst.multiprov-dupprobe-fire.r.p      |  3 +--
 test/unittest/usdt/tst.multiprov-dupprobe.r.p |  6 +----
 test/unittest/usdt/tst.multiprovider-fire.r.p |  3 +--
 test/unittest/usdt/tst.multiprovider.r.p      |  6 +----
 13 files changed, 44 insertions(+), 55 deletions(-)
 create mode 100755 test/unittest/usdt/convert_PID_and_PRID.awk
 mode change 100755 => 120000 test/unittest/usdt/err.argmap-null.r.p
 mode change 100755 => 120000 test/unittest/usdt/tst.dlclose1.r.p
 mode change 100755 => 120000 test/unittest/usdt/tst.enable_pid.r.p
 mode change 100755 => 120000 test/unittest/usdt/tst.exec-dof-replacement.r.p
 mode change 100755 => 120000 test/unittest/usdt/tst.multiprov-dupprobe-fire.r.p
 mode change 100755 => 120000 test/unittest/usdt/tst.multiprov-dupprobe.r.p
 mode change 100755 => 120000 test/unittest/usdt/tst.multiprovider-fire.r.p
 mode change 100755 => 120000 test/unittest/usdt/tst.multiprovider.r.p

diff --git a/test/unittest/usdt/convert_PID_and_PRID.awk b/test/unittest/usdt/convert_PID_and_PRID.awk
new file mode 100755
index 000000000..1dbb31301
--- /dev/null
+++ b/test/unittest/usdt/convert_PID_and_PRID.awk
@@ -0,0 +1,20 @@
+#!/usr/bin/gawk -f
+
+# ignore the banner
+/^ *ID *PROVIDER *MODULE *FUNCTION *NAME *$/ { next; }
+
+# process other lines
+{
+	# convert run-dependent PID values to "PID"
+	$0 = gensub("prov([abc]?)[0-9]+", "prov\\1PID", "g");
+	sub("pid [0-9]+", "pid PID");
+
+	# convert run-dependent probe ID values to "PRID"
+	sub("^ *[0-9]+", "PRID");
+
+	# squash blanks
+	gsub(" +", " ");
+
+	# print
+	print;
+}
diff --git a/test/unittest/usdt/err.argmap-null.r b/test/unittest/usdt/err.argmap-null.r
index 215475e39..97b1850de 100644
--- a/test/unittest/usdt/err.argmap-null.r
+++ b/test/unittest/usdt/err.argmap-null.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/usdt/err.argmap-null.d: line 24: index 0 is out of range for test_provXXXX:::place4 args[ ]
+dtrace: failed to compile script test/unittest/usdt/err.argmap-null.d: line 24: index 0 is out of range for test_provPID:::place4 args[ ]
diff --git a/test/unittest/usdt/err.argmap-null.r.p b/test/unittest/usdt/err.argmap-null.r.p
deleted file mode 100755
index c575983ad..000000000
--- a/test/unittest/usdt/err.argmap-null.r.p
+++ /dev/null
@@ -1,2 +0,0 @@
-#!/bin/sed -rf
-s,test_prov[0-9]*,test_provXXXX,g; s,^ *[0-9]+, XX,g;
diff --git a/test/unittest/usdt/err.argmap-null.r.p b/test/unittest/usdt/err.argmap-null.r.p
new file mode 120000
index 000000000..11a06e058
--- /dev/null
+++ b/test/unittest/usdt/err.argmap-null.r.p
@@ -0,0 +1 @@
+convert_PID_and_PRID.awk
\ No newline at end of file
diff --git a/test/unittest/usdt/tst.dlclose1.r b/test/unittest/usdt/tst.dlclose1.r
index 7873cb51f..70bb50d76 100644
--- a/test/unittest/usdt/tst.dlclose1.r
+++ b/test/unittest/usdt/tst.dlclose1.r
@@ -1,6 +1,4 @@
-started pid NNN
- ID PROVIDER MODULE FUNCTION NAME
-NNN test_provNNN livelib.so go go
- ID PROVIDER MODULE FUNCTION NAME
+started pid PID
+PRID test_provPID livelib.so go go
 -- @@stderr --
-dtrace: failed to match test_provNNN:::: No probe matches description
+dtrace: failed to match test_provPID:::: No probe matches description
diff --git a/test/unittest/usdt/tst.dlclose1.r.p b/test/unittest/usdt/tst.dlclose1.r.p
deleted file mode 100755
index 85725f3bb..000000000
--- a/test/unittest/usdt/tst.dlclose1.r.p
+++ /dev/null
@@ -1,12 +0,0 @@
-#!/usr/bin/gawk -f
-{
-	# ignore the specific probe ID or process ID
-	# (the script ensures the process ID is consistent)
-	gsub(/[0-9]+/, "NNN");
-
-	# ignore the numbers of spaces for alignment
-	# (they depend on the ID widths)
-	gsub(/ +/, " ");
-
-	print;
-}
diff --git a/test/unittest/usdt/tst.dlclose1.r.p b/test/unittest/usdt/tst.dlclose1.r.p
new file mode 120000
index 000000000..11a06e058
--- /dev/null
+++ b/test/unittest/usdt/tst.dlclose1.r.p
@@ -0,0 +1 @@
+convert_PID_and_PRID.awk
\ No newline at end of file
diff --git a/test/unittest/usdt/tst.enable_pid.r b/test/unittest/usdt/tst.enable_pid.r
index 675fcdd6f..9241202d7 100644
--- a/test/unittest/usdt/tst.enable_pid.r
+++ b/test/unittest/usdt/tst.enable_pid.r
@@ -1,14 +1,14 @@
-                   FUNCTION:NAME
-                        :tick-1s 
+ FUNCTION:NAME
+ :tick-1s 
 
-                   FUNCTION:NAME
-                        :tick-1s 
+ FUNCTION:NAME
+ :tick-1s 
 
-                   FUNCTION:NAME
-                        :tick-1s 
+ FUNCTION:NAME
+ :tick-1s 
 
-                   FUNCTION:NAME
-                        :tick-1s 
+ FUNCTION:NAME
+ :tick-1s 
 
 done
 ========== out 1
@@ -39,7 +39,7 @@ is not enabled
 === epoch ===
 success
 -- @@stderr --
-dtrace: description 'test_provNNN:::go ' matched 1 probe
-dtrace: description 'test_provNNN:::go ' matched 2 probes
-dtrace: description 'test_provNNN:::go ' matched 2 probes
+dtrace: description 'test_provPID:::go ' matched 1 probe
+dtrace: description 'test_provPID:::go ' matched 2 probes
+dtrace: description 'test_provPID:::go ' matched 2 probes
 dtrace: description 'test_prov*:::go ' matched 3 probes
diff --git a/test/unittest/usdt/tst.enable_pid.r.p b/test/unittest/usdt/tst.enable_pid.r.p
deleted file mode 100755
index baf9d2a90..000000000
--- a/test/unittest/usdt/tst.enable_pid.r.p
+++ /dev/null
@@ -1,7 +0,0 @@
-#!/usr/bin/awk -f
-{
-	# ignore the specific process ID
-	gsub(/test_prov[0-9]+/, "test_provNNN");
-
-	print;
-}
diff --git a/test/unittest/usdt/tst.enable_pid.r.p b/test/unittest/usdt/tst.enable_pid.r.p
new file mode 120000
index 000000000..11a06e058
--- /dev/null
+++ b/test/unittest/usdt/tst.enable_pid.r.p
@@ -0,0 +1 @@
+convert_PID_and_PRID.awk
\ No newline at end of file
diff --git a/test/unittest/usdt/tst.exec-dof-replacement.r b/test/unittest/usdt/tst.exec-dof-replacement.r
index 7547f85e5..226ab7c8a 100644
--- a/test/unittest/usdt/tst.exec-dof-replacement.r
+++ b/test/unittest/usdt/tst.exec-dof-replacement.r
@@ -1 +1 @@
-PID test_prov test2 main succeeded
+PRID test_provPID test2 main succeeded
diff --git a/test/unittest/usdt/tst.exec-dof-replacement.r.p b/test/unittest/usdt/tst.exec-dof-replacement.r.p
deleted file mode 100755
index 1a5871f73..000000000
--- a/test/unittest/usdt/tst.exec-dof-replacement.r.p
+++ /dev/null
@@ -1,2 +0,0 @@
-#!/bin/sh
-grep -v '^ *ID' | sed 's,^[0-9]*,PID,; s,prov[0-9]*,prov,g; s,  *, ,g'
diff --git a/test/unittest/usdt/tst.exec-dof-replacement.r.p b/test/unittest/usdt/tst.exec-dof-replacement.r.p
new file mode 120000
index 000000000..11a06e058
--- /dev/null
+++ b/test/unittest/usdt/tst.exec-dof-replacement.r.p
@@ -0,0 +1 @@
+convert_PID_and_PRID.awk
\ No newline at end of file
diff --git a/test/unittest/usdt/tst.multiprov-dupprobe-fire.r.p b/test/unittest/usdt/tst.multiprov-dupprobe-fire.r.p
deleted file mode 100755
index bdbce0189..000000000
--- a/test/unittest/usdt/tst.multiprov-dupprobe-fire.r.p
+++ /dev/null
@@ -1,2 +0,0 @@
-#!/bin/sh
-sed 's,prov\(.\)[0-9]*,prov\1PID,; s,  *, ,g'
diff --git a/test/unittest/usdt/tst.multiprov-dupprobe-fire.r.p b/test/unittest/usdt/tst.multiprov-dupprobe-fire.r.p
new file mode 120000
index 000000000..11a06e058
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprov-dupprobe-fire.r.p
@@ -0,0 +1 @@
+convert_PID_and_PRID.awk
\ No newline at end of file
diff --git a/test/unittest/usdt/tst.multiprov-dupprobe.r.p b/test/unittest/usdt/tst.multiprov-dupprobe.r.p
deleted file mode 100755
index 5d11db2d4..000000000
--- a/test/unittest/usdt/tst.multiprov-dupprobe.r.p
+++ /dev/null
@@ -1,5 +0,0 @@
-#!/bin/sh
-
-# Remove banner.
-# Replace numerical values with generic PRID and PID labels.
-grep -v '^ *ID' | sed 's,^[0-9][0-9]*,PRID,; s,prov\(.\)[0-9]*,prov\1PID,; s,  *, ,g'
diff --git a/test/unittest/usdt/tst.multiprov-dupprobe.r.p b/test/unittest/usdt/tst.multiprov-dupprobe.r.p
new file mode 120000
index 000000000..11a06e058
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprov-dupprobe.r.p
@@ -0,0 +1 @@
+convert_PID_and_PRID.awk
\ No newline at end of file
diff --git a/test/unittest/usdt/tst.multiprovider-fire.r.p b/test/unittest/usdt/tst.multiprovider-fire.r.p
deleted file mode 100755
index bdbce0189..000000000
--- a/test/unittest/usdt/tst.multiprovider-fire.r.p
+++ /dev/null
@@ -1,2 +0,0 @@
-#!/bin/sh
-sed 's,prov\(.\)[0-9]*,prov\1PID,; s,  *, ,g'
diff --git a/test/unittest/usdt/tst.multiprovider-fire.r.p b/test/unittest/usdt/tst.multiprovider-fire.r.p
new file mode 120000
index 000000000..11a06e058
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprovider-fire.r.p
@@ -0,0 +1 @@
+convert_PID_and_PRID.awk
\ No newline at end of file
diff --git a/test/unittest/usdt/tst.multiprovider.r.p b/test/unittest/usdt/tst.multiprovider.r.p
deleted file mode 100755
index 5d11db2d4..000000000
--- a/test/unittest/usdt/tst.multiprovider.r.p
+++ /dev/null
@@ -1,5 +0,0 @@
-#!/bin/sh
-
-# Remove banner.
-# Replace numerical values with generic PRID and PID labels.
-grep -v '^ *ID' | sed 's,^[0-9][0-9]*,PRID,; s,prov\(.\)[0-9]*,prov\1PID,; s,  *, ,g'
diff --git a/test/unittest/usdt/tst.multiprovider.r.p b/test/unittest/usdt/tst.multiprovider.r.p
new file mode 120000
index 000000000..11a06e058
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprovider.r.p
@@ -0,0 +1 @@
+convert_PID_and_PRID.awk
\ No newline at end of file
-- 
2.43.5

