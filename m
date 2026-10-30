Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793389089;
	b=nlPL9rMtE0L7zAxhlAwBqKsHaN3YM1JjMYWO4vvHek1ieQGgNr0M4OQ9FGRRpwObsO13
	 TNXp7ZHfAYWdy3ry0Zt0u7boL2TyRth+4UHSH0xhnB4Ov6AqQq+12AtvparjZBp5qXwBw
	 BtLJYmeud5pfn8hSnm+DwrudzuqTdJ6q2GAXaIszvxBko6YolphRviC6KLDrPr4CiMCOx
	 hJIpyzORfptSd/XSd5kKaaN+HdTqOIfSp1TvuE7AZRt7tZ0gzxEUCCx617RtlF+VJEZuY
	 D7oLLuHMtnS6j/Vq7lUHeLNaRAt7szC8SGOQ9EK8W/oSm9FSh3/fOQ07BZo7bgZRfSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389089;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Subject:
	 Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-TrafficTypeDiagnostic:X-MS-PublicTrafficType:client-request-id:
	 request-id:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info;
	bh=k930+f8xXgR//fL1n9RUVun5dF0sa2KOTQa6NKqQZEY=;
	b=NLhhBKSgLIYyADcZ6P0Xsayb36HeShJpBsbuJrsc4M4rwRpOSk4ByKzkxRIcHkaEMSSn
	 mQPzD3YnnGGDYyZzLxhZbfxM8PI4zx/04izASDIfE8xyMbEC1PgptM+bqzVuOKiYng2nA
	 CEz2hNEk7vcWNpbCmBGKZkgmQ7oCT1hiXhIPLOJmoDVOAyxi46DZn8ycWk0H0Y67bedMX
	 2TtxZv7Y8I6/JI0uEKF2JAhBbtdVzqocf1ZoXFgupZGSrbewMhq7NmlavKvYWaFlNDuxr
	 ndtGfLchW8KjIE9PYJ9CBfn7s6MYnAA9kUZZUYU6j8+S/kxjx5vw0/X70CnRlYgbBjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=OEweNMvD;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=j1yS+5eK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2880606A31A
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2880606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=OEweNMvD;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=j1yS+5eK
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UEYPBQ3954698
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=k930+f8xXgR//fL1n9RUVun5dF0sa2KOTQa6NKqQZEY=; b=
	OEweNMvDZLi/GOKAiZxzSQKtAQ4U92l8ODNQbnIMrw/R8tTiG60ArAWBM47xm/mK
	Qq7HIvYVOFWjaUfsqLo6gw9SSMVRd+ix1D6UUxFEElbMWOPAkmJfgn8L9vu7op0a
	lDLAK9MyVt6p8dDzRupNFMWt/RMW/zNN9AEYR0Xy4l/Dk0aBOwCq0/+rzV/XrTVn
	DmF1IVy3SK0QulDqjYX/qvgoG6oYU/CvDDz4HKExHLdJjQ80dc23U58jywYlisIY
	kBULI2m8AGmLus4H4PlGSV18UZ6Xhh+HiAzat5KMEylJCk9DOksVGr6IESwM2vGv
	bK0lm7VjdmMdHv3V5TOVKw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hme61sd03-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 69UHvsim2444507
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:04 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010068.outbound.protection.outlook.com [52.101.46.68])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4hmxs4x3v2-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GzrJcpcXhY789CIttUizMvbitRn9qMW9F81mXPeJ5l55OmNgqACbrV/hXRJVaam4fZrV1kJQICX97VIxvGE+srWItXys6fZ6XKPa2BUX5lEihzGOzu17l0rE7L7ZcH+nTSZr40pwfgkkXMV2q6m9YAXQP1krAQFVEiHFExiM42xzFtIOBD8u+fnTvHHiWQD+R0uiGGzkZGWQO8nFrFXkPTV4OK4JF3EAD/N78ZzTb661uFFJHCBCPFnmzUi0+gaGSI6LfS7g5SebU+LKCr9a0wgtl3+uPJprtLEYbG5CbhwgRpFXuyhYCwZp742fFf3bOMD9LdL6n3rt75i5wrHQfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k930+f8xXgR//fL1n9RUVun5dF0sa2KOTQa6NKqQZEY=;
 b=G4ll16c2KE6RmNeAWzpQwxu8PBqRS1x2bWnlMV+q2K42LlIovaN8toblTAL0mOMh1e7BzFnCsLzT+fmhhfDG1arATVQLQp/IOyBl0ErpQV1aHAMaTh5rrwemn+3wTwjecJz8nBHDqDywdORUjsBFFbiaJ11A01HV62Dtr6Japb/WGHkCsrRSrSPUQeeeEHQLyjabssHN3AR+xYns9nG1QnE81p61fPw/Oo/gjzf2J7UuYEdxlG6WQ6DcZG8x3/h98QuMYjtE9XmTShjddIED/wzb7I0vbRvRcbvhC0GRz0Ma46kphFo9xGo5hXklHhyOuti50BVaziKb5jmFovFViA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k930+f8xXgR//fL1n9RUVun5dF0sa2KOTQa6NKqQZEY=;
 b=j1yS+5eKTstSkE/hLKK4NosvG33X2bIXTbgBxgKG/5+p9fslajlg0TMFkeeR9ERzJEl1J3DudRV3cDbPeAO6OKyi0PJiDeJKx/DmF1yCt7D43KzdjXcBd5vNZeF6pg5Ii27HHhxcZaAGgmrv8siQ6hW0fJiaUQkDLPz5Gx1WDF0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SABPR10MB997917.namprd10.prod.outlook.com with HTTP via P2P; Fri, 30 Oct
 2026 19:38:02 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 19:38:02 +0000
Date: Fri, 30 Oct 2026 19:36:27 +0000
Message-ID: <17b15ff32c26e655d18533ca3e79bc72@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 01/20] btf: remove empty default: cases in switch statements
Content-Type: text/plain
X-ClientProxiedBy: PH8P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::6) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SABPR10MB997917:EE_
X-MS-PublicTrafficType: Email
client-request-id: 861c09cb-27e1-4161-ad2e-d7ae97113d65
request-id: ef9f94dc-7faa-49d5-769a-08df36bd4f88
X-MS-Office365-Filtering-Correlation-Id: ef9f94dc-7faa-49d5-769a-08df36bd4f88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|56012099006|261009223027099003|10067099003|261022115727099003|261021123027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rd+o/dYwXFQKpZ8E2TzcjSu+biISp4HJqepibvF0PxIvRrsEJgk095K4nZ5G+F2m9/rx25j3Jxug5CG0w5q4GV29zDTrznvSzT39/P4utZZozvdfb4E0gsyTxMNLqfz9sdJGORAsnavZYcSYueh1G61XdJ40zD0JLTodCKvIv+Qxyf3Q2Te2ZJtACqjFOyYiPO0zivxupYs63c/h2nTH3Sek5xdUsilD5HShGLfw/h9l4RkGHan0K8FQWNP+fdhEeTVgprO5PERZ0FIVHErGsE3THKwgJHHEBcxHBPWwvV/wLk1eH6KrAm0FS+hdpaXIYOuekM2nzMN9g4tczU087V6NlJ27I+a6XLx5B1v8RYS89rid5dwXZeJt0zDYA2W/+d6lT6gWLdiSVqYFD/L4GCE68P44SkWhJdZ+3lJ5hql8Cho5v5aYWGCtPPX+SbGxPcI1LWB2b2HGJcUnQdeK8+QnYi5y9qst99r8jgJJWAf1Vjq/MxHPcH3NOx9dvphtu6iUcVD/yn8Z6dDImzBXM3IMLkXiFTOUnkjCedbVSjOVbiTVQv1zIthLH5yLH2ato1XKMJsnt9XxkmhyBkSa/5yA4KoJ/K0l42hJlbbOL6HOwdGObQhfDRbQ2ehCHhjD++WLoG9ZP0uHDbsZZFmm+hwfOZXH6qQYAPh01Z6X6d4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(261009223027099003)(10067099003)(261022115727099003)(261021123027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Yf42rykOoDB9R3EAoXXc/z1v9l2pftR2cWVNagp8HeYaTlVFQMUpijN5eei4?=
 =?us-ascii?Q?V7XMRDuBKGWTF4G1x6Cpsv9SJouESMTt0GlKdWk0uZUDKjX47NX5CmA/cW/b?=
 =?us-ascii?Q?ce1RMdnjd7PkNUnx2pfSxbYWrbMbRowWGBUBWU6akCDufGy98W8rmc+aoMce?=
 =?us-ascii?Q?6VOH0d1EXWuUgmOde2WiYNzZnxOXiPYMAZtrTWxP+jH0XuQRTiA6kpra8ayy?=
 =?us-ascii?Q?gPYFI9K0CNpxBpEZ9xyTONzS4n//uqX1g+wIGunzAnIujMBNY3LC751XDDLo?=
 =?us-ascii?Q?ofu9d5t7L+bmdbP/fJr9RBmxIIRK3OHgUUu1qDq65ylk/9/mLL8RZ4S8ZbAo?=
 =?us-ascii?Q?Elyxk0CU9QQRdEmo1Z9WvnJSCl0BP0ulvxqENfWcX4O2RVZzDHIs3UWnhsat?=
 =?us-ascii?Q?D1Y3M/EWphx/b3EdX8cx2pdndUZWa//wzxLBJPR0HTBMiC6/0tlxsJ33BO86?=
 =?us-ascii?Q?ajxw66NZjXdYFfNNI6EqVAM0U/tJrW3JtCKpCUOpI56OQYuS0gueKLXuXdBP?=
 =?us-ascii?Q?sfc9tz65vPhg0K2XMwZXAuUq9NAuJamETPSddc/JfMsxHIG+xAmRIwlgrJj1?=
 =?us-ascii?Q?QbWbpOEi0+552RtyNi4rKb1BLAWhYJ/FUyACZG0Ovd66IAVM1gPXmYNtTTsb?=
 =?us-ascii?Q?XXVfnG2iSvBxMeQZnW5KT1KC5QvuM/pjP8BmpwJNM2it4CfCAzl/t0kboeUJ?=
 =?us-ascii?Q?GtglRGnlW8ieBXUPazYZNxH4pBUVZmdgp32gPo6ZH/lO6xHuQ+TYqpheM18O?=
 =?us-ascii?Q?ikqTu8atsLJbKZLB5pCoNBIieUJBquxp773TRZkY2idNiYMCOcHwh08ecuLJ?=
 =?us-ascii?Q?sk4XMusmdkNDhFhw9EQklP6zrThiermV2/1vPkl3KAWYiVrW/8W8nNvomOsO?=
 =?us-ascii?Q?jhPogvsa+ePhmRHSgTC6MZlvMQoacvTUwwdB/27gAZWzvyMifJkqTMFyMkhx?=
 =?us-ascii?Q?+j/P3+aEjKiVYFjRi70HrrD+Ev6xHx+yAYo/BwA1kbu2C3g2QUkwC5hp1wA6?=
 =?us-ascii?Q?uO0PJeyFVME187+myx5I9hkxX42UxA3gJkIcJ5tw7v2pyWNZUFKq6O/8p2No?=
 =?us-ascii?Q?Xs4wEMS8nkI5Ad98FTumGxv1mwcQicHLq2ZWEKuoLl8m3hErgiU5xSQuNvdv?=
 =?us-ascii?Q?ZV1jUIdbo98Y7u2EizPCk/eJ4A6d92XWY8riZ12S2wJbd4EOA6URck5/YMzH?=
 =?us-ascii?Q?E4uoFOe8z6YReInVibPxxYsDS+tapZIzM7p+4DdD04j6jZzao+/9+qT8Fr4D?=
 =?us-ascii?Q?j8AwXP5HYRMiStDkVB/491F0J1X5CpkoJcmbKtdSvr+v1mwYDB344aj9iTlI?=
 =?us-ascii?Q?YS/HDUxKBYi8BAxkwpPRhxKjn+z9cf+ljZ5RfBznV/WQzw7CofezTF8wxF+V?=
 =?us-ascii?Q?STkOO4snc8qCBS4/bq8jjxs4Aed76XWXwD079qUgYDIFrg5qRfnsBECPMSJt?=
 =?us-ascii?Q?Pq+YToSrwmTig6XaRHHT7M2trDK13nH4wt/l04ut869jLnrmgUrt4XA3EVlB?=
 =?us-ascii?Q?jV7CvH72AJdULXL0gHRJzOUKxs1QP+hlDlXHjt4f+h0v8qPy7UGTn77ysXXF?=
 =?us-ascii?Q?6ZMDXW2OYXKadKPC5GnDvl0E2O5G08JlaCXrz7PCmSWTxAX+YMJmljNpbUTq?=
 =?us-ascii?Q?6/xZ9G9pkiF5RzYA4keCZXnboUnSeArdIvvprjA+7dCw+IJSLlZnqXHkhr3M?=
 =?us-ascii?Q?Fj7+ho9+P/S8XT1miS9DCn6/lMaOGD2hdUUuij2KjPZAajuKHkbWrsIGqEUG?=
 =?us-ascii?Q?9eToomuyxUOE6SLpACluUqOeHL087YA=3D?=
X-Exchange-RoutingPolicyChecked:
	sHMicfrob2vRoWUPM8OMfoc6H7aCJYZNIPnRZAwxsBLzM0z4mmiUpYlVAYr/dNsDQsTMK0Ok1L5ZfCBs8RWwUWN3iWKjvWM8u6bHEfFSSA0xNV1JCzxcYiKbgrX5a5K2175yAZMJFrdoiNlH1+2nkpE0uTc0v8woyPCXEUWRSLExlJZpdCsxBDy/rbFSeKGWLjULLXmea18CnHos5bpNSrVNexEaWFYcCrvInSaKRE+Hj7vDY2rlvzf158nXGNhgNScPBSeeUis+UNG6suNJEZ9aBo68WZ5oVsGNlsLHyOF63hInqBZv7U0T1NJNrpgiQNMCnctMwTnOsralUb67tg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8vNdViqs8lZZwm241moqA2R8/NgNLRx0ZWsyZbPbnlXGscZSFAt2Y/vjhgDEZmkDG+CsTlS113D/yuiCse4zsqPok+kVlV0fWeKCN1Tf1WU43g3NPKBVwiuyEhpUxHhS9Msq1FUITDOZPVqxQSvyz4Yi88VfD2RyLW25JGwyrJEWr6N/fbAFYYa/0YApOiVt2E4DgBSVSgQiBLjG/FwY6FNuxyCibmmEVw2N8fgGXPPQJkBTkYvH7ShCe8L6Qik0RD0wDMoumlYtHFCLw/STMsZnw0jADiUglQ4m9q7XayPSJPyG+JeFt14ztqcN8whINFU8qprXUuTdMbfR82L8Lf/D9ygq+/tkqey842T4iUhxxEgcCItQjOHd9C35Dli5lGPGM9bQL05XYnNQA4JGq7rPjbz/PtXcCZZtuzepgLjSuxW4qR+XNue3m7mV4QksiMBC0I/VhC5KBLwsr85UW4LmAKgw2kPYfUL4gb+C8qsTBoWSe+xkcCEg3zYQbGyF7T/nyyVQkJTL5nN2o6pzZaiOnNI6zAGeGdP88mrtQ/awW2oYHL9Hwwmj9B8P6CI9HsuYLvKEFaSS0ax3vuao4lKq4dZ+XhQYIgo4gkuzjfc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef9f94dc-7faa-49d5-769a-08df36bd4f88
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 19:38:02.2053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNwcGOJKjoPudICUh1GZIBKXHPIBXx2FDf7YVzUZ38bYyWJUBUazsuR5jIL5H2mMkbumflIkr1rLmlwW4DtMaocaPNwO7zmEgILxJYWXjOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SABPR10MB997917
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 spamscore=0 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2610190000 definitions=main-2610300077
X-Authority-Analysis: v=2.4 cv=L9qI0OT8 c=1 sm=1 tr=0 ts=6ae4f21d b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8 a=BiEIpIZ4Ub-_Mc3K5CYA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12107
X-Proofpoint-GUID: XaP4kOJE_jW1wKfWQ-9UaeXznAfzKcEF
X-Proofpoint-ORIG-GUID: XaP4kOJE_jW1wKfWQ-9UaeXznAfzKcEF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfXwC76QSmhOkQY
 FhR3Iu/HPBUozxsYYnP1zNstjZbSzrPiVObbCU3l6TqwGgnWKYTycumfmtVA3sKQLtb4rTqxSDP
 gBEZH+JZsgoabzcfc3alVyBQfs1faGjqz3iFpIwikAu88CEDFc1wlm4FBL+SPDdU/SQU5sLgz1+
 mM3/wIkp03rRFBBgP+KlhXwVDCG7GdbT43IK4OmhgE7qpvw1/IjaTsU7WsN3R1NX9SXqNFlfqOm
 70fRME+MBJx2cPN+fZZRd1hsRQ3STg1koFOv1VdFPLsVqrq7/Tzt6NZwyp+WJOJdx4ZfrdTR6tq
 HUUriozYfoRD4PqSiRCVHE5TjQVi+G3IThXMJ7Vw1dOdsgNnn5pCItrY4ONlCX31GLOjnhZfxFK
 SxwI2prCJuxLd82RIvxIKrL9Fox8DqovRKqvIlIt8KKpfTYqRtZo6EwajIhsqIO4kph3MeVu1gb
 u+k5ZYE2UPSunksTgHTf4K4zY2Dyke1Pq2392I/U=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX38hOLsYbLzGB
 S76GYeGsL9q/o+7w/uZa1WQqdybzj86+FaxQkaR8/TQRDltCmZHadic0d8rbqjteYhYeJEKbm1c
 v0v6fXGImhy8WZJz34Z/rBsWZCyh7xg3RqmyKSwIguzFQgpY4fDe

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_btf.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
index b16289bf..55b58bf5 100644
--- a/libdtrace/dt_btf.c
+++ b/libdtrace/dt_btf.c
@@ -1069,8 +1069,6 @@ dt_btf_func_is_traceable(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
 		case BTF_KIND_STRUCT:
 		case BTF_KIND_UNION:
 			return 0;
-		default:
-			/* fall-through */
 		}
 	}
 
@@ -1097,8 +1095,6 @@ dt_btf_func_is_traceable(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
 			case BTF_KIND_UNION:
 				if (type->size > 16)	/* value size > 16 */
 					return 0;
-			default:
-				/* fall-through */
 			}
 		}
 	}
-- 
2.52.0

