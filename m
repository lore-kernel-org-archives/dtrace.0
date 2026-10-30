Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793389096;
	b=RqwEt8u8356C2yI1cTIN0w/FanH4F+oQOE/BwkBm8zD1OseKWp0k9uOYccODUOZ6IOqN
	 e/j3s/gkRIszuwA/ZwNHNrfQClpH57pfABvEkBvB8wY3O6S0BOUPbVOnxwUQbGy9uUM8q
	 IlggtQryzT3g2BhPxz7svKTLiQKA52Tj/bJXLrkmJvepR4koYeWQ52F0/6i88EgEIfccj
	 zY8CkQ21iIer5+wdE8Y5lNfPYY03XObK2QDdd4j91TN4L+5ZsKW+riKzusraDuEITDxT/
	 VtQY5JkWV75/BdXQlE8OVueYxqmjZLKInVj5bmFQSGsjg4F31JRBqsrZhHyzxKGdx5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389096;
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
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID;
	bh=36a5edNZb6oL0HdEljWer+xqo1rqb471+llnX7UEoFI=;
	b=VlpiAMCzs6iy/I95px8FpgUqPazBX3QOTbVR9QwAHMAct5zw2VpcsmgvXwxEqQH6RL9T
	 tQZzDnnwZxq1zF3T/f74mzudmW5sqj/9qjjV1qrK1QIsUvTM6nAtoT6908uxEacHDNH7i
	 cBuXY2wNHQ8JJJOwMandNnNgBIFmi39ildm0p/A15VTuSlPuI/D5mllNo/J/hm61LmhTp
	 ygeWlzTzScu2MJGzdzGOaOanwUwyileVvpkCpULG9M4T1QhOruufKbbPO0NdjYnOdiFBj
	 lzFkAJJyZxoZ/tGlXheQ6HtYcigfMpy/SP7bqG54qBBGRO+MuAS4RdRR0R9GOopTl+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=lq9aGCxZ;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=vWEDDSic;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85C9606A31D
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A85C9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=lq9aGCxZ;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=vWEDDSic
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UEXQtU3604484
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=36a5edNZb6oL0HdEljWer+xqo1rqb471+llnX7UEoFI=; b=
	lq9aGCxZiG4iUMixxB+iVzuFYdN7sBVFMq/ayRYlqYbS+7UrLTp6uuxOrvP4ttLH
	PSyK1MfXNkefCUZjvFO+vSGUiRc3GXi1oA7Q1juXXMQLqeGLI88oEGzDyeybCOba
	u117JIDxN/0OEOCQ7sWODHYjfuEKdCb1wjaDLzCMGzIkggnCjUlS1RQ74l6g2Mcz
	7yP4zJ1i1cQp8z06j5n4aTmUGjOgxXN8LwXeO14zdj4bW11MIuUSiSoLf6ivQOYs
	DOKK/xQW5QFvHfgkAR9V7Ya22OJsv2k957r/vSIAG+365DpO26tfSL+YEGol7Asl
	+zysFj+b0KUuPZJSLoJI+A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hme5s1cbw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 69UHvw2R474855
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:11 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010047.outbound.protection.outlook.com [52.101.56.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4hn01jb6vw-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Errq4U+TgDeeSxcnyR2ec+ZU6x3zIuNodbGvjj73hgj0IKWG+sDy6pOC565U/rD2MfRySUoKTnkklworwxULi0fSjDhBwwTlc41sOT5GD9dZ1Tcwic7bP5bmH6TMJ4t9VyZ1R0yT/zInD2p8tITnxsgkcWUngyzOj4mEy7JasNYKYfolpqaxHsk8wJFfUqrTpI/LjJXad1g/5D0GKFg7bPi9DMsvrhBlFGcNbNTIJgm8IxF4c09oaHVQuf6KKioofFqzErH0EMo9xIXyfsimELRyG+RygZ/eWZ4ZsDbMggjjMAGuWcyjiTBnvBk2FiCKu5jFnQXPEe+amD7xa3yi1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36a5edNZb6oL0HdEljWer+xqo1rqb471+llnX7UEoFI=;
 b=KfxFaoObEvoQWy5F/DLzIq9uFhNBuIwEaRdeX6ZceWK4G6prxQMhNScY9XbqmSVW8W0spwyQ5U+GZZA7NyTGfZqIs1k403O2RQA5SiCT9M0xY1L6evy1HhfkAf8NQhwAKNoALHoDzWlVvuoI64TEJ7TFp4q2vczMSZiZ0qDNGOON8zO5dUw3g2uRiJVBgOIdDZ5FQ0pdTuxaN23DAEllS/lejIF2hY+Z71vzBicp8ek8JuCuAyk/UotuC/PKb0DkBwCNQfy3y5eQHbLdlqPWJ1Vqdwz39cm91brCa+ZfWVZ+7gQbbcaY/815sFT+l2MCjww9r+QMg3a9+ytwMzKAWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36a5edNZb6oL0HdEljWer+xqo1rqb471+llnX7UEoFI=;
 b=vWEDDSicLKI2S97ySWDKPCZHzYO2z6nQ08/Q92iMwZKZfJM9vwCB348rMg8SPc+Hzo5lMHLJkQDBJ4kQZ5Fk5ZgJspH1KYmvsrzXFqEeH090cx4o14jkvQ9S6Jzwp6c/5NyX9/R0Xcu9Rf5YUEU9Qc+jYiPRgpa1nrqs0YzN8kQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SN7PR10MB7074.namprd10.prod.outlook.com with HTTP via P2P; Fri, 30 Oct
 2026 19:38:08 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 19:38:08 +0000
Date: Fri, 30 Oct 2026 19:36:33 +0000
Message-ID: <031b190cb7679c63673baf89f0389b9a@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 04/20] btf: deprecate dt_shared_btf and introduce btf->parent
 instead
Content-Type: text/plain
X-ClientProxiedBy: PH8P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::15) To CO1PR10MB4769.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SN7PR10MB7074:EE_
X-MS-PublicTrafficType: Email
client-request-id: 081e763c-8c3a-4a58-b55d-59efa73a6bf4
request-id: e20ecb38-ec94-40c7-0026-08df36bd5308
X-MS-Office365-Filtering-Correlation-Id: e20ecb38-ec94-40c7-0026-08df36bd5308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|261009223027099003|261026140227099003|261026130827099003|261028144727099003|261026121527099003|261026135527099003|261021121427099003|261021133027099003|261021130227099003|261022075727099003|261022105027099003|261022113327099003|261022115727099003|261021135927099003|261021123027099003|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	+3MXUOjtdIAWI3hwgLRXNeR/iPcBt5MrCdgBWeVcUumfqk9/74p5qzul6ob8ZbVYlGtb/wGZI/Wu9CXGfV0etjVpbOLl5Ns/035Vd1PNTz6haWmlGM+r62NOU+z60RNxaX2L24NJqEaRcIfCf7A29qeurWKdsGc3+N8Bov5/BhxAULsx3xSqg9OCprRIprUOoZJ7jIJAwPWl/aFv+hsqkEnaUCHW9fx8M7Tg2FPM6+BMYEmXrbhGWEgSA9Aj2oj4QpZRxF4VbzgTzRtDQcly9AGkNHCLtNN0t40a/iUbKXkILqmagOw5fXn0x948ekrXQQsdKr8S2H4TNA3Ey4vBAEQCY69+1SUt56n+rWS+BtmM+1h7nief+m/rdrwbqsxobPXJI8pCWiFTowRWDi6bSqF9UVuXpndqinwPVkbhPC9TmIVlsPFOknOyRaqfm1MtJCh0bcZzGdQ00DK5kfTd9LQSsjqcYQaDv3ferTfiNAVMpOwBOcqlKEIs+uBPK6MbA+bQdqjjHRrl4BMwqIBBubG4UJ9UUEFabO1AHBi7C0doVV2+eXihvqa7PFcOOXe1oip6MQGx/1w1V8EPH1in1jO4LHFfolL2ZVQnZXPCSVavSggGS6TmRGDlEgVMHvXx/Lme709fCeKBRf45fO1Y/CRJySaXCYfJbZv7DBDSz6U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(261009223027099003)(261026140227099003)(261026130827099003)(261028144727099003)(261026121527099003)(261026135527099003)(261021121427099003)(261021133027099003)(261021130227099003)(261022075727099003)(261022105027099003)(261022113327099003)(261022115727099003)(261021135927099003)(261021123027099003)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ClRSrW7ajrgghTqmFcBH2tS8LVNisPKUvJCiCW7awR6VINWRZGGe3G86XZq1?=
 =?us-ascii?Q?6AWZIAkT7RCxN8HmW/xSIERRVvZ2MYVGnoi/Kv4wBpmc9k20oJiY0C+IOI0S?=
 =?us-ascii?Q?e3z8k3M45x65jy+NdsVjt12y021yRdIr58Nl7/mh22+Qz4rnBpC17O43BnUt?=
 =?us-ascii?Q?GYZU1CPFs0SDEwQywcdlvGE5FbhNRde1NCTcz8gUfZSJJGDIjcbyvthpQEET?=
 =?us-ascii?Q?pU1/Yr6bSn9WSHQ6ytPrRt7HherrS0jAj2rcMgSrbD3soXM11RYkrNQbnkn1?=
 =?us-ascii?Q?+TSvHtMGvstPGj6Ow61zXH43kNcKXDl8GCJB/O/nRks1MfFDVszs2bvW8TvW?=
 =?us-ascii?Q?rzDGgE4JsvbfDLW5yrLOv4LXWVNY/SWXAeO6+L0KzuzJVbwX9Ie3vbv7DJNB?=
 =?us-ascii?Q?f6HRgZiyKDxrQw07U+a/FpyWzooXQVtM9MgRBSGJNev2iLpqpKxvZMO4SPUt?=
 =?us-ascii?Q?v4TEfN2uu42I8Fu9wHAIjsecBUFxNEnBRp1DcZ05PtPRGErKZG8MOKLcPIHw?=
 =?us-ascii?Q?6E/u+VDRPLQisuR4b85Hru0YAOeQidP9f3OHgE/MvlxXQIle1O9Q4tv+yx/G?=
 =?us-ascii?Q?M45gTNyQ7cJSfpRv0LoOrqT+4qvW0hqDDWLcHdY+tHt17xPvkGVoGxaFS0yk?=
 =?us-ascii?Q?a/LMsryYmTb/L6/AC1bfuq+FkwstwV9KxUgoxROErOvKhJpx2BlDuJstEzck?=
 =?us-ascii?Q?TYqjU0iU64woPon3uDTVFuEIyoMZl0gCnxiRlUVgeEV3WZBYMErVgh90iYJk?=
 =?us-ascii?Q?1H7zm+UD0t4X7O6pi80vf/2iyF7parRXHmWvwYGQPPNjMYMGwX+RYu+35e2X?=
 =?us-ascii?Q?gSO4O9+7RFMsH6rvrxf+beL4SbC9dM2wylqwdzoSD73BL49gw+0vjOoKWNlI?=
 =?us-ascii?Q?lECSxu+2T0OvyiAshkHjHQgXjjG9rIx032qYVZL9JBlOzjYZE1ZyX/Nxtxfx?=
 =?us-ascii?Q?ittspUscWG3P2JlgZ1gbXKfLBQAkHhdZD86n+shbFYjE1vL/IUSatfmDCjMQ?=
 =?us-ascii?Q?iVc2rw/CBsPLILMlOpD07CMW9IWmUkxrBcR2yaLJDztCBj7SrGOWyzr51nlB?=
 =?us-ascii?Q?QLRoGavvVagVPG2XPoYPqXC4usYynE/gCXK3Uaz+//SDZqYaLN4qNqT5Q4LR?=
 =?us-ascii?Q?ns15C4TVZ2aW/Me69ma9TCanX9qsM4MAlMkvttj3pg07iMa0NeIXL+Fy+6By?=
 =?us-ascii?Q?g1Y9pmHY7TB2TE7BnX9pMkBhMdlnWxzIKJInLWNKz/PKZpJ0SM7ecsPiETP5?=
 =?us-ascii?Q?1H3DmRhM24RlHkCOoW1Umc3WnE3aidGiP5cUGFsr/AjRqY88zGxV7Id3pcEg?=
 =?us-ascii?Q?EO5Kb+bFV3/Tu6CnCJpjsHTgSk0B/mprPbTh9R44VCfY+xdYtHekvfu31IbV?=
 =?us-ascii?Q?N0Sk5NS6D62U3U0XJsh8KoKfQXmmpXXxsMWsIpZqmAEZ8VCBdg2r4/XNUITb?=
 =?us-ascii?Q?G/h+H0XkQjiaar29kKZCFc4dzwvyH9nag7PVrSC4YDsASilagPNYlGMeoj8l?=
 =?us-ascii?Q?KN6eMup7oFCTcIkK4wxY8lC7bKPG6LTZCYfGw4/bkT1+veACAC7EPmkwv94c?=
 =?us-ascii?Q?LIdNg7XK3qWwiPNKTtrC/exkhQwvAty3sgsXRXNTjF/AugSci0R7aotIFCE7?=
 =?us-ascii?Q?dRqE7UPqvTbDmao6PgV2LoH6U1cIexW9e4u+sjUhwhYgLNFZbNQpvv5iHUsX?=
 =?us-ascii?Q?YxU0ZkbdcC8euLDPF2wIOHev31MpwGtoZxdRnJ7ULG9dLGKz6R8yxtt7WCat?=
 =?us-ascii?Q?OJasdPQgjbxfFN6bywabuBBiby3fCrQ=3D?=
X-Exchange-RoutingPolicyChecked:
	jItzktJlRSxiBCSuAfiXQ/fy283e5qmtAr/E07SzsZGxLr2iNZk9VIpxIpEDId+nz80SCkqmHYnV0MaRwyymKtEI07JrnqsFhNRJr8wsbupExq58Y0sTEygQt3T1p8KoISODY0aqmTN1tyTC0cJFz8EV7tfLsfmLo23aAaL86THF2q9UJBRIZY1uQw1n3ENHeTBregxzYoeVSZSIRqqoAeAVv8GqHr6iPVnJCvoUN1SFlD4gWRoLfhZCdEb2cvf3Q07rPzBqQa8dIzbZZBdTHqRD7XA9YEagGl4E96d+vIzggYwHEmobeK37+hhlXF8FrxXMpqERkym11WA+Zpavhw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cojCxo6zRERSQ0KMir5xVl366zC6yjEzVFMk7VsCf/s7D9k2t8OPAQz6yVBoytREPWoOvSu4mZttgaeMmg5v+efnjYtqR72Ds/kpURaZLtom7mk1kHZyx9wcfKyKwvh5w9QXNejqFneGb09vV2BtNg687NZntXI89MeUPLRsWAIaiT0581ci82qGoSUtnyMNix+Ya19Pi5Ft5MlU7CQhYiK275HCkQsyr6HB+bs7oz7yWEplJiWtyvFBrN98CK26lc4P7WkLziBT4sJnIPRvdQJ3m/vIrXRTVTRPScrAwpDpRI/OvqnOasaJZ7EW1KQb4QfB6O3gEmuFbY5KkP1e+hsV+Oqy1vgr8e/OGEs3W0AR3xKB0UMu5OkQZeoj2DNoCYpkrG6UU5KIroxMfO/HG5/HPOQ6o6G7kca3pwTIjWr9iUGvKfy4eD+WSBLs2k+G3prmNDIRyuhASMq5WvFqmoIAkipcrXvH79zSh6dPrXfwimuuPHxOeC3RAfCWKV9PVr8CHZdTkHfrHlw3egj0t0GnJ41qkrNWix5NoHoKI3YcWwxgdmXCMIf526TI0S0sObK+nVFgFK6K9pXJUtRvPhD5Qa6U1DDRdxObpSWjGrI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e20ecb38-ec94-40c7-0026-08df36bd5308
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 19:38:08.1125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IMdrrAzSx+22xLi5L+Zs7huWRzKfDEcbkt4ay/1MeBGYEq+IiqYH4ob0ZdiaTpjuiKEmzjmRgNI1+ZiV/+YMed8lAFPAIE1rfv7B3v+mQDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7074
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300078
X-Authority-Analysis: v=2.4 cv=BdJNQbt2 c=1 sm=1 tr=0 ts=6ae4f224 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8 a=G2TCG6PtBmqYOme8bNAA:9
X-Proofpoint-ORIG-GUID: vH06qa3Ekbswcs_YgL7M1XUy8ofwJb-E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX0iD3SaZ/mpyp
 jRx7eZQ25GgJUjyKrwP58OmMGD9IfFcJ35gI20dUc3HlMdi5nhz52DbD8lBapRDoJ8Ym6NtQ0Z8
 XEu/B5TrCXhbYcpoOYMbQlpFlrP13g7d6VOgP3a0lylfkA2FHLCx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX7+GRT5D/Oa+n
 ncwQCX8TBn+/Xk4rzYkVeD5Ari04NMhgSphZtSWmpUXjo8tonnWbBc4mYYtQdsSOkzvQ8BCQ5XG
 xEq+fkji0rn7zUWK8ighWb3nxN0Q3U7CM3OFCdcgwzulkaf/XOjWDEfqdPPkj60QB7GFwESx+uE
 kVdUcWtR4ZM6DGMZeeRzx+qJRt92buOr8G53YYuAb/sxa81M59i0l9z/S+ucssH1dsV/msw9J5/
 v0a/IbgnpDBq9i0XLDJWwS6VLif2QkCdGkLtWQNsRlKo/iha1mSl5HqOF6gNZXKUnJUiP1B6/oQ
 aqenTsGRO/l8Z4wR+0bKyBXcse1pvHHgovoOw+yZFTLUwxKMl94UfN7L03CLjYDHjCQwKr4UvR2
 EQ4L7zfD2oNKXPhCu8UtrjsQK6SiLr+abi6rmpCpw4pRKaCbTHiVjwY6eK627nLKU22wEqyAB9h
 gV1vTal2zKWBLuyRl6Q==
X-Proofpoint-GUID: vH06qa3Ekbswcs_YgL7M1XUy8ofwJb-E

All module BTF (except vmlinux) share a common ancestor (the BTF data of
the vmlinux module).  Represent this with a btf->parent reference.

For vmlinux, btf->parent will be NULL.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_btf.c                        | 517 +++++++++++++---------
 libdtrace/dt_btf.h                        |  19 +-
 libdtrace/dt_impl.h                       |   2 +-
 libdtrace/dt_module.c                     |  18 +-
 libdtrace/dt_open.c                       |   2 -
 libdtrace/dt_prov_fbt.c                   |  16 +-
 test/unittest/btf/test.x                  |   8 +
 test/unittest/btf/tst.elf-vmlinux.sh      |  31 ++
 test/unittest/btf/tst.elf-vmlinux.x       |   8 +
 test/unittest/btf/tst.invalid-fallback.sh |  31 ++
 test/unittest/btf/tst.invalid-fallback.x  |   8 +
 test/unittest/btf/tst.module-btf.sh       |  46 ++
 test/unittest/btf/tst.module-btf.x        |  13 +
 test/unittest/btf/tst.module-local.sh     |  63 +++
 test/unittest/btf/tst.module-local.x      |  18 +
 test/unittest/btf/tst.module-parent.sh    |  46 ++
 test/unittest/btf/tst.module-parent.x     |  13 +
 test/unittest/btf/tst.raw-vmlinux.sh      |  30 ++
 test/unittest/options/tst.ctf-only.sh     |  27 ++
 test/unittest/options/tst.ctf-only.x      |   8 +
 20 files changed, 693 insertions(+), 231 deletions(-)
 create mode 100755 test/unittest/btf/test.x
 create mode 100755 test/unittest/btf/tst.elf-vmlinux.sh
 create mode 100755 test/unittest/btf/tst.elf-vmlinux.x
 create mode 100755 test/unittest/btf/tst.invalid-fallback.sh
 create mode 100755 test/unittest/btf/tst.invalid-fallback.x
 create mode 100755 test/unittest/btf/tst.module-btf.sh
 create mode 100755 test/unittest/btf/tst.module-btf.x
 create mode 100755 test/unittest/btf/tst.module-local.sh
 create mode 100755 test/unittest/btf/tst.module-local.x
 create mode 100755 test/unittest/btf/tst.module-parent.sh
 create mode 100755 test/unittest/btf/tst.module-parent.x
 create mode 100755 test/unittest/btf/tst.raw-vmlinux.sh
 create mode 100755 test/unittest/options/tst.ctf-only.sh
 create mode 100755 test/unittest/options/tst.ctf-only.x

diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
index dce44987..194a251c 100644
--- a/libdtrace/dt_btf.c
+++ b/libdtrace/dt_btf.c
@@ -32,8 +32,8 @@ struct dt_btf {
 	size_t		size;			/* raw BTF data size */
 	btf_header_t	*hdr;			/* BTF header */
 	char		*sdata;			/* string data */
-	uint32_t	ssize;			/* string data size */
-	int32_t		type_cnt;		/* number of types */
+	const dt_btf_t	*parent;		/* parent BTF */
+	uint32_t	type_cnt;		/* number of types */
 	btf_type_t	**types;		/* type table */
 	ctf_id_t	*ctfids;		/* matching CTF type ids */
 };
@@ -71,12 +71,86 @@ dt_btf_error(dtrace_hdl_t *dtp, int eid, const char *format, ...)
 	va_end(ap);
 }
 
+static btf_type_t *
+dt_btf_type_by_id(const dt_btf_t *btf, int32_t id)
+{
+	const dt_btf_t	*shared_btf;
+	uint32_t	shared_cnt;
+
+	if (id == 0)
+		return &btf_void;
+
+	shared_btf = btf->parent;
+	if (shared_btf != NULL) {
+		shared_cnt = shared_btf->type_cnt;
+		if (id < shared_cnt)
+			return shared_btf->types[id];
+
+		if (shared_cnt > 0)
+			id -= shared_cnt - 1;
+	}
+
+	if (id < btf->type_cnt && id > 0)
+		return btf->types[id];
+
+	return NULL;
+}
+
+static btf_type_t *
+dt_btf_real_type_by_id(const dt_btf_t *btf, int32_t id)
+{
+	btf_type_t	*type = dt_btf_type_by_id(btf, id);
+
+	while (type != NULL) {
+		switch (BTF_INFO_KIND(type->info)) {
+		case BTF_KIND_CONST:
+		case BTF_KIND_FUNC:
+		case BTF_KIND_RESTRICT:
+		case BTF_KIND_TYPE_TAG:
+		case BTF_KIND_TYPEDEF:
+		case BTF_KIND_VOLATILE:
+			type = dt_btf_type_by_id(btf, type->type);
+			continue;
+		default:
+			return type;
+		}
+	}
+
+	return NULL;
+}
+
+static const char *
+dt_btf_get_string(const dt_btf_t *btf, uint32_t off)
+{
+	const dt_btf_t	*shared_btf;
+	int32_t		shared_len;
+
+	shared_btf = btf->parent;
+	if (shared_btf != NULL && shared_btf->hdr != NULL) {
+		shared_len = shared_btf->hdr->str_len;
+		if (off < shared_len)
+			return shared_btf->sdata + off;
+
+		off -= shared_len;
+	}
+
+	if (off < btf->hdr->str_len)
+		return btf->sdata + off;
+
+	return NULL;
+}
+
 static int
 dt_btf_validate_header(dtrace_hdl_t *dtp, dt_btf_t *btf)
 {
 	btf_header_t	*hdr = (btf_header_t *)btf->data;
 
-	btf->hdr = hdr;
+	if (btf->size < sizeof(btf_header_t)) {
+		dt_dprintf("BTF truncated header (%ld)\n", btf->size);
+		return dt_btf_set_errno(dtp, EINVAL);
+	}
+
+	hdr = (btf_header_t *)btf->data;
 
 	/* Validate magic number. */
 	if (hdr->magic != BTF_MAGIC) {
@@ -97,24 +171,39 @@ dt_btf_validate_header(dtrace_hdl_t *dtp, dt_btf_t *btf)
 		dt_dprintf("BTF type offset misaligned (%d)\n", hdr->type_off);
 		return dt_btf_set_errno(dtp, EINVAL);
 	}
-	if (hdr->type_off + hdr->type_len > hdr->str_off) {
+	if (hdr->type_off >= btf->size - hdr->hdr_len) {
+		dt_dprintf("BTF bad type offset (%d)\n", hdr->type_off);
+		return dt_btf_set_errno(dtp, EINVAL);
+	}
+	if (hdr->str_off <= hdr->type_off ||
+	    hdr->str_off >= btf->size - hdr->hdr_len) {
+		dt_dprintf("BTF bad string offset (%d)\n", hdr->str_off);
+		return dt_btf_set_errno(dtp, EINVAL);
+	}
+	if (hdr->type_len > hdr->str_off - hdr->type_off) {
 		dt_dprintf("BTF bad type section length (%d)\n", hdr->type_len);
 		return dt_btf_set_errno(dtp, EINVAL);
 	}
-	if (hdr->hdr_len + hdr->str_off + hdr->str_len > btf->size) {
+	if (hdr->str_len > btf->size - hdr->hdr_len - hdr->str_off) {
 		dt_dprintf("BTF bad string section length (%d)\n",
 			   hdr->str_len);
 		return dt_btf_set_errno(dtp, EINVAL);
 	}
+	if (((char *)btf->data)[hdr->hdr_len + hdr->str_off + hdr->str_len - 1] != 0) {
+		dt_dprintf("BTF string section is not NUL-terminated\n");
+		return dt_btf_set_errno(dtp, EINVAL);
+	}
+
+	btf->hdr = hdr;
 
 	return 0;
 }
 
-static size_t
+static ssize_t
 dt_btf_type_size(const char *ptr)
 {
 	btf_type_t	*type = (btf_type_t *)ptr;
-	size_t		size = sizeof(btf_type_t);
+	ssize_t		size = sizeof(btf_type_t);
 	int		vlen = BTF_INFO_VLEN(type->info);
 
 	switch (BTF_INFO_KIND(type->info)) {
@@ -164,7 +253,7 @@ dt_btf_decode(dtrace_hdl_t *dtp, dt_btf_t *btf)
 	char		*tdata;
 
 	if (dt_btf_validate_header(dtp, btf) == -1)
-		return -1;
+		return dt_btf_set_errno(dtp, EINVAL);
 
 	hdr = btf->hdr;
 	btf->sdata = (char *)btf->data + hdr->hdr_len + hdr->str_off;
@@ -175,19 +264,18 @@ dt_btf_decode(dtrace_hdl_t *dtp, dt_btf_t *btf)
 	end = tdata + hdr->type_len;
 	idx = 1;
 	while (ptr + sizeof(btf_type_t) <= end) {
-		int		size = dt_btf_type_size(ptr);
+		ssize_t		size = dt_btf_type_size(ptr);
 		btf_type_t	*type = (btf_type_t *)ptr;
 
-		if (size < 0)
-			return dt_btf_set_errno(dtp,  -size);
-		if (ptr + size > end)
-			return dt_btf_set_errno(dtp,  EINVAL);
-		if (dt_btf_get_string(dtp, btf, type->name_off) == NULL)
-			return dt_btf_set_errno(dtp,  EINVAL);
+		if (size < 0 || ptr + size > end ||
+		    dt_btf_get_string(btf, type->name_off) == NULL)
+			return dt_btf_set_errno(dtp, EINVAL);
 
 		idx++;
 		ptr += size;
 	}
+	if (ptr != end)
+		return dt_btf_set_errno(dtp, EINVAL);
 
 	/* Next, populate the type offsets table. */
 	btf->type_cnt = idx;
@@ -198,11 +286,16 @@ dt_btf_decode(dtrace_hdl_t *dtp, dt_btf_t *btf)
 	ptr = tdata;
 	idx = 1;
 	while (ptr + sizeof(btf_type_t) <= end) {
-		int	size = dt_btf_type_size(ptr);
+		ssize_t	size = dt_btf_type_size(ptr);
+
+		if (size < 0)
+			return dt_btf_set_errno(dtp, EINVAL);
 
 		btf->types[idx++] = (btf_type_t *)ptr;
 		ptr += size;
 	}
+	if (ptr != end)
+		return dt_btf_set_errno(dtp, EINVAL);
 
 	return 0;
 }
@@ -216,11 +309,10 @@ dt_btf_decode(dtrace_hdl_t *dtp, dt_btf_t *btf)
 static dt_btf_t *
 dt_btf_load(dtrace_hdl_t *dtp, const char *fn)
 {
-	FILE		*fp;
+	FILE		*fp = NULL;
 	dt_btf_t	*btf = NULL;
 	btf_header_t	hdr;
-	void		*data = NULL;
-	Elf		*elf;
+	Elf		*elf = NULL;
 	size_t		shstrs;
 	Elf_Scn		*sp = NULL;
 	int		err = 0;
@@ -230,36 +322,45 @@ dt_btf_load(dtrace_hdl_t *dtp, const char *fn)
 		return dt_btf_set_load_errno(dtp, ENOMEM);
 
 	fp = fopen(fn, "rb");
-	if (fp == NULL)
-		goto err;
+	if (fp == NULL) {
+		dtp->dt_btferr = errno;
+		goto fail;
+	}
 
 	/* First see whether this might be a file with raw BTF data. */
-	if (fread(&hdr, 1, sizeof(hdr), fp) < sizeof(hdr))
+	if (fread(&hdr, 1, sizeof(hdr), fp) < sizeof(hdr)) {
+		dtp->dt_btferr = ferror(fp) ? EIO : EINVAL;
 		goto fail;
+	}
 
 	rewind(fp);
 	if (hdr.magic == BTF_MAGIC) {
 		struct stat	st;
 
-		if (fstat(fileno(fp), &st) == -1)
+		if (fstat(fileno(fp), &st) == -1) {
+			dtp->dt_btferr = errno;
 			goto fail;
+		}
 
-		data = dt_alloc(dtp, st.st_size);
-		if (data == NULL)
+		btf->data = dt_alloc(dtp, st.st_size);
+		if (btf->data == NULL) {
+			dtp->dt_btferr = ENOMEM;
 			goto fail;
+		}
 
-		if (fread(data, 1, st.st_size, fp) < st.st_size)
+		if (fread(btf->data, 1, st.st_size, fp) < st.st_size) {
+			dtp->dt_btferr = ferror(fp) ? EIO : EINVAL;
 			goto fail;
+		}
 
-		fclose(fp);
-
-		btf->data = data;
 		btf->size = st.st_size;
 	} else {
 		/* Next see whether this might be an ELF file with BTF data. */
 		elf = elf_begin(fileno(fp), ELF_C_READ_MMAP, NULL);
-		if (elf == NULL)
-			goto elf_fail_no_end;
+		if (elf == NULL) {
+			dtp->dt_btferr = EINVAL;
+			goto elf_fail;
+		}
 		if (elf_getshdrstrndx(elf, &shstrs) == -1)
 			goto elf_fail;
 
@@ -282,59 +383,78 @@ dt_btf_load(dtrace_hdl_t *dtp, const char *fn)
 			if (edata == NULL)
 				goto elf_fail;
 
-			data = dt_alloc(dtp, edata->d_size);
-			if (data == NULL)
-				goto elf_fail;
+			btf->data = dt_alloc(dtp, edata->d_size);
+			if (btf->data == NULL) {
+				dtp->dt_btferr = ENOMEM;
+				goto fail;
+			}
 
-			memcpy(data, edata->d_buf, edata->d_size);
+			memcpy(btf->data, edata->d_buf, edata->d_size);
 
-			btf->data = data;
 			btf->size = edata->d_size;
-
-			elf_end(elf);
-			fclose(fp);
-
 			break;
 		}
+		if (btf->data == NULL) {
+			dtp->dt_btferr = ENOENT;
+			goto fail;
+		}
 	}
 
+	if (elf != NULL)
+		elf_end(elf);
+	fclose(fp);
 	return btf;
 
 elf_fail:
-	elf_end(elf);
-
-elf_fail_no_end:
+	dtp->dt_btferr = EINVAL;
 	err = elf_errno();
-	dt_btf_error(dtp, 0, "BTF: %s", elf_errmsg(err));
+	dt_btf_error(dtp, 0, "ELF: %s", elf_errmsg(err));
 
 fail:
-	fclose(fp);
-	dt_free(dtp, data);
-
-err:
-	dt_free(dtp, btf);
-	dt_btf_set_errno(dtp,  err ? err : errno);
-
+	if (elf != NULL)
+		elf_end(elf);
+	if (fp != NULL)
+		fclose(fp);
+	dt_dprintf("Cannot open BTF file %s: %s\n", fn,
+			   dt_btf_errmsg(dtp->dt_btferr));
+	dt_btf_destroy(dtp, btf);
 	return NULL;
 }
 
 dt_btf_t *
-dt_btf_load_file(dtrace_hdl_t *dtp, const char *fn)
+dt_btf_load_file(dtrace_hdl_t *dtp, const char *fn, const dt_btf_t *parent)
 {
 	dt_btf_t	*btf;
 
+	/*
+	 * Missing BTF or allocation failure returns NULL; invalid data leaves
+	 * an empty BTF.
+	 */
 	btf = dt_btf_load(dtp, fn);
-	if (btf == NULL) {
-		dt_dprintf("Cannot open BTF file %s: %s\n", fn,
-			   dt_btf_errmsg(dtp->dt_btferr));
+	if (btf == NULL)
 		return NULL;
-	}
 
-	if (dt_btf_decode(dtp, btf) == -1) {
+	btf->parent = parent;
+
+	/* Decode the loaded BTF data. */
+	if (btf->data && dt_btf_decode(dtp, btf) == -1) {
+		if (dtp->dt_btferr == ENOMEM) {
+			dt_btf_destroy(dtp, btf);
+			return NULL;
+		}
+
+		/*
+		 * Failure to decode the data leaves us with just one option:
+		 * pretend the module has no type data beyond its parent's
+		 * data.
+		 */
 		dt_dprintf("Cannot decode BTF data %s: %s\n", fn,
 			   dt_btf_errmsg(dtp->dt_btferr));
-		dt_btf_destroy(dtp, btf);
-		return NULL;
+
+		dt_free(dtp, btf->data);
+		dt_free(dtp, btf->types);
+		memset(btf, 0, sizeof(*btf));
+		btf->parent = parent;
 	}
 
 	dt_dprintf("BTF file %s: %d types\n", fn, btf->type_cnt);
@@ -342,6 +462,70 @@ dt_btf_load_file(dtrace_hdl_t *dtp, const char *fn)
 	return btf;
 }
 
+dt_btf_t *
+dt_btf_load_module(dtrace_hdl_t *dtp, dt_module_t *dmp)
+{
+	char		*fn = NULL;
+	int		rc = 0;
+	const dt_btf_t	*parent = NULL;
+
+	assert(dmp != NULL);
+
+	/* If already tried this for the module, return what we have. */
+	if (dmp->dm_flags & DT_DM_BTF_LOADED)
+		return dmp->dm_btf;
+
+	/*
+	 * If the module is not vmlinux, we will use the vmlinux BTF data as the
+	 * parent.
+	 */
+	if (dmp != dtp->dt_exec) {
+		parent = dtp->dt_exec->dm_btf;
+		/* If we do not have it yet, try to load it. */
+		if (parent == NULL)
+			parent = dt_btf_load_module(dtp, dtp->dt_exec);
+		/* If loading failed, the module cannot have BTF data either. */
+		if (parent == NULL)
+			return NULL;
+	}
+
+	/*
+	 * Default: /sys/kernel/btf/<module>
+	 * If "none", disable BTF.
+	 * Otherwise: <BTF path>/<module>
+	 */
+	if (dtp->dt_btf_path == NULL)
+		rc = asprintf(&fn, "/sys/kernel/btf/%s", dmp->dm_name);
+	else if (strcmp(dtp->dt_btf_path, "none") == 0)
+		return NULL;
+	else
+		rc = asprintf(&fn, "%s/%s", dtp->dt_btf_path, dmp->dm_name);
+
+	if (rc == -1)
+		return dt_btf_set_load_errno(dtp, ENOMEM);
+
+	dmp->dm_btf = dt_btf_load_file(dtp, fn, parent);
+	free(fn);
+
+	if (dmp->dm_btf == NULL) {
+		if (dtp->dt_btferr != ENOENT)
+			return NULL;
+
+		/* A missing module BTF file still inherits its parent's types. */
+		if (parent != NULL) {
+			dmp->dm_btf = dt_zalloc(dtp, sizeof(dt_btf_t));
+			if (dmp->dm_btf == NULL)
+				return dt_btf_set_load_errno(dtp, ENOMEM);
+
+			dmp->dm_btf->parent = parent;
+		}
+	}
+
+	dmp->dm_flags |= DT_DM_BTF_LOADED;
+
+	return dmp->dm_btf;
+}
+
 void
 dt_btf_destroy(dtrace_hdl_t *dtp, dt_btf_t *btf)
 {
@@ -371,8 +555,9 @@ dt_ctf_error(dtrace_hdl_t *dtp, ctf_dict_t *ctf)
 
 static ctf_id_t
 dt_btf_add_to_ctf(dtrace_hdl_t *dtp, dt_btf_t *btf, ctf_dict_t *ctf,
-		  int32_t type_id)
+		  uint32_t type_id)
 {
+	const dt_btf_t	*shared_btf = btf->parent;
 	btf_type_t	*type;
 	int		kind, vlen;
 	const char	*name;
@@ -383,11 +568,12 @@ dt_btf_add_to_ctf(dtrace_hdl_t *dtp, dt_btf_t *btf, ctf_dict_t *ctf,
 	 * If we already have shared_ctf, we may be looking for a type in that
 	 * shared_ctf.
 	 */
-	if (dt_module_shared_ctf(dtp) && btf != dtp->dt_shared_btf) {
-		if (type_id < dtp->dt_shared_btf->type_cnt)
-			return dtp->dt_shared_btf->ctfids[type_id];
+	if (dt_module_shared_ctf(dtp) && shared_btf != NULL) {
+		if (type_id < shared_btf->type_cnt)
+			return shared_btf->ctfids[type_id];
 
-		type_id -= dtp->dt_shared_btf->type_cnt - 1;
+		if (shared_btf->type_cnt > 0)
+			type_id -= shared_btf->type_cnt - 1;
 	}
 
 	assert(type_id < btf->type_cnt);
@@ -400,9 +586,11 @@ dt_btf_add_to_ctf(dtrace_hdl_t *dtp, dt_btf_t *btf, ctf_dict_t *ctf,
 	type = btf->types[type_id];
 	kind = BTF_INFO_KIND(type->info);
 	vlen = BTF_INFO_VLEN(type->info);
-	name = dt_btf_get_string(dtp, btf, type->name_off);
+	name = dt_btf_get_string(btf, type->name_off);
+	if (name == NULL)
+		return dt_ctf_set_errno(dtp, ECTF_NAMELEN);
 
-	if (name && name[0]) {
+	if (name[0]) {
 		char	n[DT_TYPE_NAMELEN];
 
 		/* Do we already have this type? */
@@ -498,7 +686,9 @@ dt_btf_add_to_ctf(dtrace_hdl_t *dtp, dt_btf_t *btf, ctf_dict_t *ctf,
 			int	err;
 			const char	*iname;
 
-			iname = dt_btf_get_string(dtp, btf, item->name_off);
+			iname = dt_btf_get_string(btf, item->name_off);
+			if (iname == NULL)
+				return dt_ctf_set_errno(dtp, ECTF_NAMELEN);
 			err = ctf_add_enumerator(ctf, ctfid, iname, item->val);
 			if (err == CTF_ERR)
 				return dt_ctf_error(dtp, ctf);
@@ -599,7 +789,9 @@ dt_btf_add_to_ctf(dtrace_hdl_t *dtp, dt_btf_t *btf, ctf_dict_t *ctf,
 			mbid = dt_btf_add_to_ctf(dtp, btf, ctf, item->type);
 			if (mbid == CTF_ERR)
 				return CTF_ERR;
-			mname = dt_btf_get_string(dtp, btf, item->name_off);
+			mname = dt_btf_get_string(btf, item->name_off);
+			if (mname == NULL)
+				return dt_ctf_set_errno(dtp, ECTF_NAMELEN);
 
 			if (BTF_INFO_KFLAG(type->info)) {
 				enc.cte_format = 0;
@@ -741,6 +933,13 @@ dt_btf_to_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp, dt_btf_t *btf)
 	if (!btf)
 		goto out;
 
+	/*
+	 * If we were not able to read the BTF data, and we are constructing
+	 * 'shared_ctf', we need space for the default 'void' type.
+	 */
+	if (!dmp && !btf->type_cnt)
+		btf->type_cnt = 1;
+
 	btf->ctfids = dt_calloc(dtp, btf->type_cnt, sizeof(ctf_id_t));
 	for (i = 1; i < btf->type_cnt; i++)
 		btf->ctfids[i] = CTF_ERR;
@@ -758,14 +957,14 @@ dt_btf_to_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp, dt_btf_t *btf)
 		/*
 		 * Any module other than 'vmlinux' inherits the types from
 		 * 'vmlinux'.
-		 * Shared types are 1 through dt_shared_btf->type_cnt - 1
+		 * Shared types are 1 through btf->parent->type_cnt - 1
 		 * (base).
 		 * A module's types are base through base + btf->type_cnt - 1,
 		 * but the types are stored in the BTF types array with indexes
 		 * 1 through btf->type_cnt - 1.
 		 */
-		if (btf != dtp->dt_shared_btf)
-			base = dtp->dt_shared_btf->type_cnt - 1;
+		if (btf->parent != NULL && btf->parent->type_cnt > 0)
+			base = btf->parent->type_cnt - 1;
 	}
 
 	for (i = 1; i < btf->type_cnt; i++) {
@@ -789,40 +988,6 @@ out:
 }
 #endif
 
-dt_btf_t *
-dt_btf_load_module(dtrace_hdl_t *dtp, dt_module_t *dmp)
-{
-	char		*fn = NULL;
-	int		rc = 0;
-	dt_btf_t	*btf;
-
-	if (dmp->dm_btf)
-		return dmp->dm_btf;
-
-	/*
-	 * Default: /sys/kernel/btf/<module>
-	 * If "none", disable BTF.
-	 * Otherwise: <BTF path>/<module>
-	 */
-	if (dtp->dt_btf_path == NULL)
-		rc = asprintf(&fn, "/sys/kernel/btf/%s", dmp->dm_name);
-	else if (strcmp(dtp->dt_btf_path, "none") == 0)
-		return NULL;
-	else
-		rc = asprintf(&fn, "%s/%s", dtp->dt_btf_path, dmp->dm_name);
-
-	if (rc == -1)
-		return dt_btf_set_load_errno(dtp, ENOMEM);
-
-	btf = dt_btf_load_file(dtp, fn);
-	free(fn);
-
-	if (btf && !dtp->dt_shared_btf && strcmp(dmp->dm_name, "vmlinux") == 0)
-		dtp->dt_shared_btf = btf;
-
-	return dmp->dm_btf = btf;
-}
-
 ctf_dict_t *
 dt_btf_module_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 {
@@ -854,8 +1019,7 @@ dt_btf_module_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 		shared->dm_flags |= DT_DM_LOADED;
 	}
 
-	ctf = dt_btf_to_ctf(dtp, dmp,
-			    btf == dtp->dt_shared_btf ? NULL : btf);
+	ctf = dt_btf_to_ctf(dtp, dmp, btf);
 
 	dt_dprintf("Generated %s CTF from BTF (%d types).\n", dmp->dm_name,
 		   btf->type_cnt);
@@ -864,112 +1028,65 @@ dt_btf_module_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 	return ctf;
 }
 
-static btf_type_t *
-dt_btf_type_by_id(dtrace_hdl_t *dtp, const dt_btf_t *btf, int32_t id)
-{
-	if (id == 0)
-		return &btf_void;
-	if (id < dtp->dt_shared_btf->type_cnt)
-		return dtp->dt_shared_btf->types[id];
-
-	return btf->types[id - (dtp->dt_shared_btf->type_cnt - 1)];
-}
-
-static btf_type_t *
-dt_btf_real_type_by_id(dtrace_hdl_t *dtp, const dt_btf_t *btf, int32_t id)
+static uint32_t
+dt_btf_lookup_name_kind2(const dt_btf_t *btf, int32_t base, const char *name,
+			 uint32_t kind)
 {
-	btf_type_t	*type = dt_btf_type_by_id(dtp, btf, id);
-
-	do {
-		switch (BTF_INFO_KIND(type->info)) {
-		case BTF_KIND_CONST:
-		case BTF_KIND_FUNC:
-		case BTF_KIND_RESTRICT:
-		case BTF_KIND_TYPE_TAG:
-		case BTF_KIND_TYPEDEF:
-		case BTF_KIND_VOLATILE:
-			type = dt_btf_type_by_id(dtp, btf, type->type);
-		default:
-			return type;
-		}
-	} while (type != NULL);
-
-	return NULL;
-}
+	uint32_t	i;
 
-const char *
-dt_btf_get_string(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t off)
-{
-	if (dtp->dt_shared_btf == NULL)
-		goto ok;
+	/* Look through the type data for a match. */
+	for (i = 1; i < btf->type_cnt; i++) {
+		const btf_type_t	*type = btf->types[i];
+		const char		*str;
 
-	/* Check if the offset is within the base BTF string area. */
-	if (btf == dtp->dt_shared_btf || off < dtp->dt_shared_btf->hdr->str_len)
-		return dtp->dt_shared_btf->sdata + off;
+		if (BTF_INFO_KIND(type->info) != kind)
+			continue;
 
-	off -= dtp->dt_shared_btf->hdr->str_len;
-ok:
-	if (off < btf->hdr->str_len)
-		return btf->sdata + off;
+		str = dt_btf_get_string(btf, type->name_off);
+		if (str == NULL)
+			continue;
+		if (strcmp(name, str) == 0)
+			return i + base;
+	}
 
-	return dt_btf_set_load_errno(dtp, EINVAL);
+	return BTF_TYPE_NONE;
 }
 
-int32_t
+uint32_t
 dt_btf_lookup_name_kind(dtrace_hdl_t *dtp, dt_module_t *dmp, const char *name,
 			uint32_t kind)
 {
-	dt_btf_t	*btf = dmp->dm_btf;
-	int32_t		i, base = 0;
+	dt_btf_t	*btf;
+	const dt_btf_t	*parent;
+	int32_t		base = 0, id;
 
 	if (kind == BTF_KIND_UNKN)
-		return -ENOENT;
+		return BTF_TYPE_NONE;
 	if (strcmp(name, "void") == 0)
 		return 0;
 
-	/* Ensure the shared BTF is loaded. */
-	if (!dtp->dt_shared_btf)
-		dt_btf_load_module(dtp, dtp->dt_exec);
-
-	/* If the module does not have BTF data yet, try to load it. */
-	if (!btf) {
-		btf = dt_btf_load_module(dtp, dmp);
+	/* Get BTF data for the module. */
+	btf = dt_btf_load_module(dtp, dmp);
 
-		/* If no BTF module data was found, use the shared BTF. */
-		if (!btf)
-			btf = dtp->dt_shared_btf;
-
-		if (!btf)
-			return -ENOENT;
-	}
+	/* No type lookup without BTF data. */
+	if (!btf)
+		return BTF_TYPE_NONE;
 
 	/*
-	 * Any module other than 'vmlinux' inherits the types from 'vmlinux'.
-	 * The shared types are 1 through (base = dtp->dt_btf->type_cnt - 1).
-	 * A module's types are base through (base + btf->type_cnt - 1), but
-	 * the types are stored in the BTF types array with indexes 1 through
-	 * (btf->type_cnt - 1).
+	 * BTF type data for a module is split between two BTF data source:
+	 *   shared	[ 0 .. parent->type_cnt - 1 ]
+	 *   local	base + [ 1 .. type_cnt ]
+	 *   			with base = parent->type_cnt - 1
 	 */
-	if (btf != dtp->dt_shared_btf)
-		base = dtp->dt_shared_btf->type_cnt - 1;
-
-
-	for (i = 1; i < btf->type_cnt; i++) {
-		const btf_type_t	*type = btf->types[i];
-		const char		*str;
-
-		if (BTF_INFO_KIND(type->info) != kind)
-			continue;
-
-		str = dt_btf_get_string(dtp, btf, type->name_off);
-		if (str && strcmp(name, str) == 0)
-			return i + base;
-	}
+	parent = btf->parent;
+	if (parent != NULL && parent->type_cnt > 0)
+		base = parent->type_cnt - 1;
 
-	if (base > 0)
-		return dt_btf_lookup_name_kind(dtp, dtp->dt_exec, name, kind);
+	id = dt_btf_lookup_name_kind2(btf, base, name, kind);
+	if (id == BTF_TYPE_NONE && parent != NULL)
+		id = dt_btf_lookup_name_kind2(parent, 0, name, kind);
 
-	return -ENOENT;
+	return id;
 }
 
 int
@@ -1025,9 +1142,9 @@ dt_btf_module_fd(const dt_module_t *dmp)
 }
 
 int
-dt_btf_func_argc(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
+dt_btf_func_argc(const dt_btf_t *btf, uint32_t id)
 {
-	btf_type_t	*type = dt_btf_real_type_by_id(dtp, btf, id);
+	btf_type_t	*type = dt_btf_real_type_by_id(btf, id);
 
 	if (type == NULL)
 		return -1;
@@ -1039,9 +1156,9 @@ dt_btf_func_argc(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
 }
 
 int
-dt_btf_func_is_void(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
+dt_btf_func_is_void(const dt_btf_t *btf, uint32_t id)
 {
-	btf_type_t	*type = dt_btf_real_type_by_id(dtp, btf, id);
+	btf_type_t	*type = dt_btf_real_type_by_id(btf, id);
 
 	if (type != NULL &&
 	    BTF_INFO_KIND(type->info) == BTF_KIND_FUNC_PROTO && type->type == 0)
@@ -1058,9 +1175,9 @@ dt_btf_func_is_void(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
  */
 #define MAX_BPF_FUNC_REG_REGS	5
 int
-dt_btf_func_is_traceable(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
+dt_btf_func_is_traceable(const dt_btf_t *btf, uint32_t id)
 {
-	btf_type_t	*type = dt_btf_real_type_by_id(dtp, btf, id);
+	btf_type_t	*type = dt_btf_real_type_by_id(btf, id);
 	int		argc;
 
 	/* If no prototype is found, BPF fprobes do not work. */
@@ -1069,7 +1186,7 @@ dt_btf_func_is_traceable(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
 
 	/* If the return type is a struct or union, BPF fprobes do not work. */
 	if (type->type != 0) {
-		btf_type_t	*rtype = dt_btf_real_type_by_id(dtp, btf, type->type);
+		btf_type_t	*rtype = dt_btf_real_type_by_id(btf, type->type);
 
 		if (rtype == NULL)
 			return 0;
@@ -1095,7 +1212,7 @@ dt_btf_func_is_traceable(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
 			return 0;
 
 		for (i = 0; i < argc; i++) {
-			type = dt_btf_real_type_by_id(dtp, btf, args[i].type);
+			type = dt_btf_real_type_by_id(btf, args[i].type);
 			if (type == NULL)
 				return 0;
 
diff --git a/libdtrace/dt_btf.h b/libdtrace/dt_btf.h
index 2c921a03..a581ae6d 100644
--- a/libdtrace/dt_btf.h
+++ b/libdtrace/dt_btf.h
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2023, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -14,22 +14,19 @@
 extern "C" {
 #endif
 
+#define BTF_TYPE_NONE		0x7fffffff
+
 typedef struct dt_btf		dt_btf_t;
 typedef struct bpf_btf_info	btf_info_t;
 
 extern void dt_btf_destroy(dtrace_hdl_t *, dt_btf_t *);
 extern dt_btf_t *dt_btf_load_module(dtrace_hdl_t *, dt_module_t *);
 extern ctf_dict_t *dt_btf_module_ctf(dtrace_hdl_t *, dt_module_t *);
-extern const char *dt_btf_get_string(dtrace_hdl_t *, const dt_btf_t *,
-				     uint32_t);
-extern int32_t dt_btf_lookup_name_kind(dtrace_hdl_t *, dt_module_t *,
-				       const char *, uint32_t);
-extern int dt_btf_func_argc(dtrace_hdl_t *dtp, const dt_btf_t *btf,
-			    uint32_t id);
-extern int dt_btf_func_is_void(dtrace_hdl_t *dtp, const dt_btf_t *btf,
-			       uint32_t id);
-extern int dt_btf_func_is_traceable(dtrace_hdl_t *dtp, const dt_btf_t *btf,
-				    uint32_t id);
+extern uint32_t dt_btf_lookup_name_kind(dtrace_hdl_t *, dt_module_t *,
+					const char *, uint32_t);
+extern int dt_btf_func_argc(const dt_btf_t *btf, uint32_t id);
+extern int dt_btf_func_is_void(const dt_btf_t *btf, uint32_t id);
+extern int dt_btf_func_is_traceable(const dt_btf_t *btf, uint32_t id);
 extern int dt_btf_get_module_ids(dtrace_hdl_t *);
 extern int dt_btf_module_fd(const dt_module_t *);
 
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 682dda82..cf04d0f6 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -202,6 +202,7 @@ typedef struct dt_kern_path {
 #define DT_DM_KERNEL		0x02	/* module is associated with a kernel object */
 #define DT_DM_CTF_ARCHIVED	0x04	/* module found in a CTF archive */
 #define DT_DM_KERN_UNLOADED	0x08	/* module not loaded into the kernel */
+#define DT_DM_BTF_LOADED	0x10	/* module BTF data loaded */
 #define DT_DM_SHARED		0x20	/* module owns shared kernel CTF */
 #define DT_DM_KERN_SYMS		0x40	/* kernel symbols discovered and finalized */
 
@@ -311,7 +312,6 @@ struct dtrace_hdl {
 	ctf_archive_t *dt_ctfa; /* ctf archive for the entire kernel tree */
 	void *dt_ctfa_data;	/* backing data for dt_ctfa */
 	char *dt_btf_path;	/* path to vmlinux.btf */
-	struct dt_btf *dt_shared_btf; /* BTF data for the kernel (shared) */
 	dt_htab_t *dt_kernpaths; /* hash table of dt_kern_path_t's */
 	dt_module_t *dt_exec;	/* pointer to executable module */
 	dt_module_t *dt_cdefs;	/* pointer to C dynamic type module */
diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
index 10e54412..0b0023a3 100644
--- a/libdtrace/dt_module.c
+++ b/libdtrace/dt_module.c
@@ -1045,8 +1045,7 @@ dt_module_clear_elf(dt_module_t *dmp)
 static void
 dt_module_destroy(dtrace_hdl_t *dtp, dt_module_t *dmp)
 {
-	if (dmp->dm_btf != dtp->dt_shared_btf)
-		dt_btf_destroy(dtp, dmp->dm_btf);
+	dt_btf_destroy(dtp, dmp->dm_btf);
 	ctf_close(dmp->dm_ctfp);
 	dt_module_clear_elf(dmp);
 	dt_symtab_destroy(dtp, dmp->dm_kernsyms);
@@ -1253,23 +1252,24 @@ dt_kern_module_ctf_from_btf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 static void
 dt_kern_module_find_btf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 {
+	/* The vmlinux module nust already exist as dtp->dt_exec. */
+	assert(dtp->dt_exec != NULL);
+
 	/*
 	 * If there is no shared BTF data, and we're trying to load BTF data
-	 * for any module other than "vmlinux", we can conclude no module has
+	 * for any module other than vmlinux, we can conclude no module has
 	 * valid BTF data.
 	 */
-	if (dtp->dt_shared_btf == NULL && strcmp(dmp->dm_name, "vmlinux") != 0)
+	if (dtp->dt_exec->dm_btf == NULL && dmp != dtp->dt_exec)
 		return;
 
 	dt_dprintf("Loading BTF for module %s.\n", dmp->dm_name);
 
 	/*
-	 * If no module specific BTF is found, we assume it is a builtin
-	 * module and we assign the shared BTF to it.  That is the fallback
-	 * anyway for type lookups in modules, so it is safe.
+	 * If no module specific BTF is found, the kernel either does not
+	 * provide any BTF data or something went wrong.  Neither is fatal.
 	 */
-	if (dt_btf_load_module(dtp, dmp) == NULL)
-		dmp->dm_btf = dtp->dt_shared_btf;
+	dt_btf_load_module(dtp, dmp);
 }
 
 /*
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 6182a5da..245ccb70 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -1314,8 +1314,6 @@ dtrace_close(dtrace_hdl_t *dtp)
 	dt_htab_destroy(dtp->dt_mods);
 	dt_htab_destroy(dtp->dt_kernpaths);
 
-	if (dtp->dt_shared_btf != NULL)
-		dt_btf_destroy(dtp, dtp->dt_shared_btf);
 	if (dtp->dt_ctfa != NULL)
 		ctf_arc_close(dtp->dt_ctfa);
 	free(dtp->dt_ctfa_data);
diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 3ae03581..8bdfc89f 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -103,11 +103,11 @@ static int provide_probe(dtrace_hdl_t *dtp, dt_module_t *dmp,
 	 * details).
 	 */
 	if (prv->impl->prog_type == BPF_PROG_TYPE_TRACING) {
-		int32_t	btf_id;
+		uint32_t	btf_id;
 
 		btf_id = dt_btf_lookup_name_kind(dtp, dmp, pdp->fun, BTF_KIND_FUNC);
-		if (btf_id <= 0 ||
-		    !dt_btf_func_is_traceable(dtp, dmp->dm_btf, btf_id))
+		if (btf_id == BTF_TYPE_NONE ||
+		    !dt_btf_func_is_traceable(dmp->dm_btf, btf_id))
 			return -1;
 	}
 
@@ -355,7 +355,7 @@ static int fprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 {
 	const dtrace_probedesc_t	*desc = prp->desc;
 	dt_module_t			*dmp;
-	int32_t				btf_id;
+	uint32_t			btf_id;
 	int				i, argc = 0;
 	dt_argdesc_t			*argv = NULL;
 
@@ -364,14 +364,14 @@ static int fprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		goto done;
 
 	btf_id = dt_btf_lookup_name_kind(dtp, dmp, desc->fun, BTF_KIND_FUNC);
-	if (btf_id <= 0)
+	if (btf_id == BTF_TYPE_NONE)
 		goto done;
 
 	dt_tp_probe_set_id(prp, btf_id);
 
 	if (strcmp(desc->prb, "return") == 0) {
 		/* Void function return probes only provide 1 argument. */
-		argc = dt_btf_func_is_void(dtp, dmp->dm_btf, btf_id) ? 1 : 2;
+		argc = dt_btf_func_is_void(dmp->dm_btf, btf_id) ? 1 : 2;
 
 		argv = dt_calloc(dtp, argc, sizeof(dt_argdesc_t));
 		if (argv == NULL)
@@ -392,8 +392,8 @@ static int fprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		goto done;
 	}
 
-	argc = dt_btf_func_argc(dtp, dmp->dm_btf, btf_id);
-	if (argc == 0)
+	argc = dt_btf_func_argc(dmp->dm_btf, btf_id);
+	if (argc <= 0)
 		goto done;
 
 	argv = dt_calloc(dtp, argc, sizeof(dt_argdesc_t));
diff --git a/test/unittest/btf/test.x b/test/unittest/btf/test.x
new file mode 100755
index 00000000..3aad9b2a
--- /dev/null
+++ b/test/unittest/btf/test.x
@@ -0,0 +1,8 @@
+#!/bin/bash
+
+if [ ! -r /sys/kernel/btf/vmlinux ]; then
+	echo "No vmlinux BTF data found."
+	exit 2
+fi
+
+exit 0
diff --git a/test/unittest/btf/tst.elf-vmlinux.sh b/test/unittest/btf/tst.elf-vmlinux.sh
new file mode 100755
index 00000000..f8132e74
--- /dev/null
+++ b/test/unittest/btf/tst.elf-vmlinux.sh
@@ -0,0 +1,31 @@
+#!/bin/bash
+#
+# ASSERTION: The BTF loader reads a .BTF section from an ELF object.
+#
+
+dtrace=$1
+dir=$tmpdir/btf-elf-vmlinux.$$
+mkdir -p "$dir" || exit 1
+
+"${OBJCOPY:-objcopy}" --add-section \
+	.BTF=/sys/kernel/btf/vmlinux /bin/true "$dir/vmlinux" || exit 1
+
+"$dtrace" $dt_flags -e -xdebug -xctfpath="$dir/missing.ctfa" \
+	-xbtfpath="$dir" -n '
+BEGIN
+{
+	this->size = sizeof(struct vmlinux`task_struct);
+}' >"$dir/output" 2>&1
+rc=$?
+if [ "$rc" -ne 0 ]; then
+	cat "$dir/output"
+	exit 1
+fi
+
+if ! grep -q "BTF file $dir/vmlinux: [1-9][0-9]* types" "$dir/output" ||
+   ! grep -q 'Generated vmlinux CTF from BTF' "$dir/output"; then
+	cat "$dir/output"
+	exit 1
+fi
+
+exit 0
diff --git a/test/unittest/btf/tst.elf-vmlinux.x b/test/unittest/btf/tst.elf-vmlinux.x
new file mode 100755
index 00000000..c444fe67
--- /dev/null
+++ b/test/unittest/btf/tst.elf-vmlinux.x
@@ -0,0 +1,8 @@
+#!/bin/bash
+
+if ! command -v "${OBJCOPY:-objcopy}" >/dev/null 2>&1; then
+	echo "objcopy is needed to create an ELF BTF fixture."
+	exit 2
+fi
+
+exit 0
diff --git a/test/unittest/btf/tst.invalid-fallback.sh b/test/unittest/btf/tst.invalid-fallback.sh
new file mode 100755
index 00000000..58632306
--- /dev/null
+++ b/test/unittest/btf/tst.invalid-fallback.sh
@@ -0,0 +1,31 @@
+#!/bin/bash
+#
+# ASSERTION: Invalid raw BTF is rejected and a usable CTF archive is loaded.
+#
+
+dtrace=$1
+dir=$tmpdir/btf-invalid-fallback.$$
+mkdir -p "$dir" || exit 1
+
+# Preserve the BTF magic, but truncate the file at the end of its header.
+# This enters the raw BTF loader and fails header validation.
+head -c 24 /sys/kernel/btf/vmlinux >"$dir/vmlinux" || exit 1
+
+"$dtrace" $dt_flags -e -xdebug -xbtfpath="$dir" -n '
+BEGIN
+{
+	this->size = sizeof(struct vmlinux`task_struct);
+}' >"$dir/output" 2>&1
+rc=$?
+if [ "$rc" -ne 0 ]; then
+	cat "$dir/output"
+	exit 1
+fi
+
+if ! grep -q "Cannot decode BTF data $dir/vmlinux" "$dir/output" ||
+   ! grep -q 'Loaded shared CTF from archive' "$dir/output"; then
+	cat "$dir/output"
+	exit 1
+fi
+
+exit 0
diff --git a/test/unittest/btf/tst.invalid-fallback.x b/test/unittest/btf/tst.invalid-fallback.x
new file mode 100755
index 00000000..372dc5c0
--- /dev/null
+++ b/test/unittest/btf/tst.invalid-fallback.x
@@ -0,0 +1,8 @@
+#!/bin/bash
+
+if [ ! -r /lib/modules/$(uname -r)/kernel/vmlinux.ctfa ]; then
+	echo "No vmlinux CTF archive found."
+	exit 2
+fi
+
+exit 0
diff --git a/test/unittest/btf/tst.module-btf.sh b/test/unittest/btf/tst.module-btf.sh
new file mode 100755
index 00000000..fe1f7b54
--- /dev/null
+++ b/test/unittest/btf/tst.module-btf.sh
@@ -0,0 +1,46 @@
+#!/bin/bash
+#
+# ASSERTION: Split module BTF loads with vmlinux as its parent and converts
+#            into a CTF container usable for scoped parent type lookup.
+#
+
+dtrace=$1
+dir=$tmpdir/btf-module.$$
+mkdir -p "$dir" || exit 1
+ln -s /sys/kernel/btf/vmlinux "$dir/vmlinux" || exit 1
+
+module=
+for path in /sys/kernel/btf/*; do
+	[ "$path" = /sys/kernel/btf/vmlinux ] && continue
+	[ -r "$path" ] || continue
+	name=${path##*/}
+	[[ $name =~ ^[A-Za-z_][A-Za-z0-9_]*$ ]] || continue
+	module=$name
+	ln -s "$path" "$dir/$module" || exit 1
+	break
+done
+
+if [ -z "$module" ]; then
+	echo "No suitable loaded kernel module with BTF data."
+	exit 1
+fi
+
+"$dtrace" $dt_flags -e -xdebug -xctfpath="$dir/missing.ctfa" \
+	-xbtfpath="$dir" -n "
+BEGIN
+{
+	this->size = sizeof(struct ${module}\`task_struct);
+}" >"$dir/output" 2>&1
+rc=$?
+if [ "$rc" -ne 0 ]; then
+	cat "$dir/output"
+	exit 1
+fi
+
+if ! grep -q "BTF file $dir/$module: [1-9][0-9]* types" "$dir/output" ||
+   ! grep -q "Generated $module CTF from BTF" "$dir/output"; then
+	cat "$dir/output"
+	exit 1
+fi
+
+exit 0
diff --git a/test/unittest/btf/tst.module-btf.x b/test/unittest/btf/tst.module-btf.x
new file mode 100755
index 00000000..d27b0499
--- /dev/null
+++ b/test/unittest/btf/tst.module-btf.x
@@ -0,0 +1,13 @@
+#!/bin/bash
+
+for path in /sys/kernel/btf/*; do
+	[ "$path" = /sys/kernel/btf/vmlinux ] && continue
+	[ -r "$path" ] || continue
+	module=${path##*/}
+	if [[ $module =~ ^[A-Za-z_][A-Za-z0-9_]*$ ]]; then
+		exit 0
+	fi
+done
+
+echo "No suitable loaded kernel module with BTF data."
+exit 2
diff --git a/test/unittest/btf/tst.module-local.sh b/test/unittest/btf/tst.module-local.sh
new file mode 100755
index 00000000..74a07370
--- /dev/null
+++ b/test/unittest/btf/tst.module-local.sh
@@ -0,0 +1,63 @@
+#!/bin/bash
+#
+# ASSERTION: A module-local BTF type converts to CTF and the module also
+#            inherits types from its vmlinux BTF parent.
+#
+
+dtrace=$1
+dir=$tmpdir/btf-module-local.$$
+mkdir -p "$dir" || exit 1
+ln -s /sys/kernel/btf/vmlinux "$dir/vmlinux" || exit 1
+
+module=
+for path in /sys/kernel/btf/*; do
+	[ "$path" = /sys/kernel/btf/vmlinux ] && continue
+	[ -r "$path" ] || continue
+	name=${path##*/}
+	[[ $name =~ ^[A-Za-z_][A-Za-z0-9_]*$ ]] || continue
+	module=$name
+	break
+done
+[ -n "$module" ] || exit 1
+
+# BTF name offsets in split data follow the parent string table.  Build a
+# single local struct whose name is absent from the real kernel BTF.
+python3 - "$dir/$module" <<'PY' || exit 1
+import struct
+import sys
+
+with open('/sys/kernel/btf/vmlinux', 'rb') as parent:
+    header = parent.read(24)
+magic, version, flags, header_len, type_off, type_len, str_off, str_len = \
+    struct.unpack('<HBBIIIII', header)
+if magic != 0xeb9f or version != 1:
+    raise ValueError('unsupported parent BTF header')
+
+name = b'\0dtrace_btf_local_test\0'
+type_data = struct.pack('<III', str_len + 1, 4 << 24, 8)
+child_header = struct.pack('<HBBIIIII', 0xeb9f, 1, 0, 24,
+                           0, len(type_data), len(type_data), len(name))
+with open(sys.argv[1], 'wb') as child:
+    child.write(child_header + type_data + name)
+PY
+
+"$dtrace" $dt_flags -e -xdebug -xctfpath="$dir/missing.ctfa" \
+	-xbtfpath="$dir" -n "
+BEGIN
+{
+	this->local_size = sizeof(struct ${module}\`dtrace_btf_local_test);
+	this->parent_size = sizeof(struct ${module}\`task_struct);
+}" >"$dir/output" 2>&1
+rc=$?
+if [ "$rc" -ne 0 ]; then
+	cat "$dir/output"
+	exit 1
+fi
+
+if ! grep -q "BTF file $dir/$module: 2 types" "$dir/output" ||
+   ! grep -q "Generated $module CTF from BTF (2 types)" "$dir/output"; then
+	cat "$dir/output"
+	exit 1
+fi
+
+exit 0
diff --git a/test/unittest/btf/tst.module-local.x b/test/unittest/btf/tst.module-local.x
new file mode 100755
index 00000000..0d60fdcc
--- /dev/null
+++ b/test/unittest/btf/tst.module-local.x
@@ -0,0 +1,18 @@
+#!/bin/bash
+
+if ! command -v python3 >/dev/null 2>&1; then
+	echo "Python 3 is needed to generate split BTF data."
+	exit 2
+fi
+
+for path in /sys/kernel/btf/*; do
+	[ "$path" = /sys/kernel/btf/vmlinux ] && continue
+	[ -r "$path" ] || continue
+	module=${path##*/}
+	if [[ $module =~ ^[A-Za-z_][A-Za-z0-9_]*$ ]]; then
+		exit 0
+	fi
+done
+
+echo "No suitable loaded kernel module with BTF data."
+exit 2
diff --git a/test/unittest/btf/tst.module-parent.sh b/test/unittest/btf/tst.module-parent.sh
new file mode 100755
index 00000000..5a521362
--- /dev/null
+++ b/test/unittest/btf/tst.module-parent.sh
@@ -0,0 +1,46 @@
+#!/bin/bash
+#
+# ASSERTION: A kernel module without its own BTF inherits vmlinux types.
+#
+
+dtrace=$1
+dir=$tmpdir/btf-module-parent.$$
+mkdir -p "$dir" || exit 1
+ln -s /sys/kernel/btf/vmlinux "$dir/vmlinux" || exit 1
+
+module=
+for path in /sys/kernel/btf/*; do
+	[ "$path" = /sys/kernel/btf/vmlinux ] && continue
+	[ -r "$path" ] || continue
+	name=${path##*/}
+	[[ $name =~ ^[A-Za-z_][A-Za-z0-9_]*$ ]] || continue
+	module=$name
+	break
+done
+
+if [ -z "$module" ]; then
+	echo "No loaded kernel module with BTF data."
+	exit 1
+fi
+
+# Deliberately leave $dir/$module absent.  This exercises the inherited
+# parent-only BTF container, including its CTF import for scoped lookup.
+"$dtrace" $dt_flags -e -xdebug -xctfpath="$dir/missing.ctfa" \
+	-xbtfpath="$dir" -n "
+BEGIN
+{
+	this->size = sizeof(struct ${module}\`task_struct);
+}" >"$dir/output" 2>&1
+rc=$?
+if [ "$rc" -ne 0 ]; then
+	cat "$dir/output"
+	exit 1
+fi
+
+if ! grep -q "Cannot open BTF file $dir/$module:" "$dir/output" ||
+   ! grep -q "Generated $module CTF from BTF (0 types)" "$dir/output"; then
+	cat "$dir/output"
+	exit 1
+fi
+
+exit 0
diff --git a/test/unittest/btf/tst.module-parent.x b/test/unittest/btf/tst.module-parent.x
new file mode 100755
index 00000000..d27b0499
--- /dev/null
+++ b/test/unittest/btf/tst.module-parent.x
@@ -0,0 +1,13 @@
+#!/bin/bash
+
+for path in /sys/kernel/btf/*; do
+	[ "$path" = /sys/kernel/btf/vmlinux ] && continue
+	[ -r "$path" ] || continue
+	module=${path##*/}
+	if [[ $module =~ ^[A-Za-z_][A-Za-z0-9_]*$ ]]; then
+		exit 0
+	fi
+done
+
+echo "No suitable loaded kernel module with BTF data."
+exit 2
diff --git a/test/unittest/btf/tst.raw-vmlinux.sh b/test/unittest/btf/tst.raw-vmlinux.sh
new file mode 100755
index 00000000..12280ba6
--- /dev/null
+++ b/test/unittest/btf/tst.raw-vmlinux.sh
@@ -0,0 +1,30 @@
+#!/bin/bash
+#
+# ASSERTION: Raw vmlinux BTF is loaded and converted to usable CTF when the
+#            CTF archive is unavailable, even if the host has an archive.
+#
+
+dtrace=$1
+dir=$tmpdir/btf-raw-vmlinux.$$
+mkdir -p "$dir" || exit 1
+ln -s /sys/kernel/btf/vmlinux "$dir/vmlinux" || exit 1
+
+"$dtrace" $dt_flags -e -xdebug -xctfpath="$dir/missing.ctfa" \
+	-xbtfpath="$dir" -n '
+BEGIN
+{
+	this->size = sizeof(struct vmlinux`task_struct);
+}' >"$dir/output" 2>&1
+rc=$?
+if [ "$rc" -ne 0 ]; then
+	cat "$dir/output"
+	exit 1
+fi
+
+if ! grep -q "BTF file $dir/vmlinux: [1-9][0-9]* types" "$dir/output" ||
+   ! grep -q 'Generated vmlinux CTF from BTF' "$dir/output"; then
+	cat "$dir/output"
+	exit 1
+fi
+
+exit 0
diff --git a/test/unittest/options/tst.ctf-only.sh b/test/unittest/options/tst.ctf-only.sh
new file mode 100755
index 00000000..8ca8a0ac
--- /dev/null
+++ b/test/unittest/options/tst.ctf-only.sh
@@ -0,0 +1,27 @@
+#!/bin/bash
+#
+# ASSERTION: Kernel types still load from the CTF archive when BTF is disabled.
+#
+
+dtrace=$1
+dir=$tmpdir/ctf-only.$$
+mkdir -p "$dir" || exit 1
+
+"$dtrace" $dt_flags -e -xdebug -xbtfpath=none -n '
+BEGIN
+{
+	this->size = sizeof(struct vmlinux`task_struct);
+}' >"$dir/output" 2>&1
+rc=$?
+if [ "$rc" -ne 0 ]; then
+	cat "$dir/output"
+	exit 1
+fi
+
+if ! grep -q 'Loaded shared CTF from archive' "$dir/output" ||
+   grep -q 'Generated vmlinux CTF from BTF' "$dir/output"; then
+	cat "$dir/output"
+	exit 1
+fi
+
+exit 0
diff --git a/test/unittest/options/tst.ctf-only.x b/test/unittest/options/tst.ctf-only.x
new file mode 100755
index 00000000..372dc5c0
--- /dev/null
+++ b/test/unittest/options/tst.ctf-only.x
@@ -0,0 +1,8 @@
+#!/bin/bash
+
+if [ ! -r /lib/modules/$(uname -r)/kernel/vmlinux.ctfa ]; then
+	echo "No vmlinux CTF archive found."
+	exit 2
+fi
+
+exit 0
-- 
2.52.0

