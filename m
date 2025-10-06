Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2D9299927
	for <dtrace@lists.linux.dev>; Mon,  6 Oct 2025 15:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759764530; cv=fail; b=h+USLsxh6hMZYaYZfAH2KWT2Zc3nnU+La/vvl+I/vOn05g2ODERsWcuk8HY6VH4Pk/QQ/RFm17Smep0wP/61+SFXUAtWeCS0SKVdJYQ8Z336o4Rp0e5IujTy69wLvvNZfMl3ApYv89sx8nITNZqptnsoeODazrONeJnjIqd1xMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759764530; c=relaxed/simple;
	bh=whlejkgFthqAkw/6bY+dwcbu93U/N5vnh9g3wBe1gYw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MV2JNYvdvO3iljKtNAv6feuucui1cGYsxC1v4CXpXTucljvt3ra/X8QUxUzc/dXdnTQ/4S/0BYnrPEG04hRjAiFJXiG5jX6uj2mVF39E3rWBXpA9pORkTTj+nUw17ZV0l13ADtfjVnuQN0m8lBLvO7ODxi5ifEVN8srKXP0bojs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=U7njWoIF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=v+zwb4IO; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="U7njWoIF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="v+zwb4IO"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596F4lcA005307
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 15:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=AnVkofsaNMnJhe0ZDek2xKCgwf+auqV/mkILy24+uBI=; b=
	U7njWoIFxvlQvvI4SO5lk6SnoSu1VzgkivOPNgzwDNTwMfCs0avCHFrk8SWpPzQn
	1nuKr+2GH1Ho5YxlA34E01jLsHVw5wJPDUPErqvQ3YQ+OVkjijbgPdz5kDpkhcCh
	63vviASaR+AzpX5azlOJtyLgTwp75spTHGhoN9wD+Xv7D2WoVJIgWHlLlbK9m+xv
	Ksa+gQ1qS9I1gJdPnSYYBS/m1MHezjkkyX1GairxdRzVrVJm6oVIQR7xADitOUNH
	aMOkb1HTxluWXrzMM9Lao0o71zz0eEZOwyWR5/0gpwRkJ5fgia9v/dIQNwE1UXtK
	TJACPlGexcCHfY+Gpc1+2Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49mg3a81xu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 15:28:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 596E8f3h028585
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 15:28:45 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012006.outbound.protection.outlook.com [40.107.209.6])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49jt170bh4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 15:28:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jvgoQyV0+7r8a2O8WUHyFZ805VJBfDaRPbzj8cWyPaiNheJYik4VphFhxHmoNEdpcMMfDNFy9ql0MQ2wkv0xXZCQRG9dCtAKjOuzPpjGYEICCIekIoXswFExmSz7JeFFw6Fkzkp/31Zv2KIOr6KK8jWExhVKoFzXf9bHawtOUyreQcNJrpqob1Sz4Ih19pkV/JBQPqIINAS+gXcND9c1/2gdc8fcAbfOMGRD1ZJ/iRNifSQpY9eP2/OfcheeCJWPsG7iJ+zKJPUr9aa/y2CGXruH+BURAOtG4zhuZ1ua0bY2EQMSabiwjBDO6EypMGR5Mjs9y1id77lEqJxq2qffZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnVkofsaNMnJhe0ZDek2xKCgwf+auqV/mkILy24+uBI=;
 b=yacINjeUakWEqvYxrF4ezPlafci2gMgc9snXsXqO1n4tUkhHeHjLSnbVUfnePfs/2EGB3uWDP4UXK7Z6jvhoZTXecFUBJq1nb+dYf1e2P3A1o2GQbE6XQ7hC6J0CCbW1KHaSocN7iTcdzs1LuG3pHcj76jxXJCzNh3ntVyy2wqb9RtJio+Qx3gy3cCsl43XDIHdg2+fSRguvu6XMSxsa6pBjSPHt7NKInvkE1rVTS5wKKTmVSTjP9BZq4QqabtJ/+N4YKQlu9WiuAHTL2W0JdFpagTJ/5VHQHtcRDgdsNveY2sj+qXVFAA1IiJy7RjP0hPPkKJ46Mo5iqmh+1IIFOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnVkofsaNMnJhe0ZDek2xKCgwf+auqV/mkILy24+uBI=;
 b=v+zwb4IOUkjzcUxTQlRoWOgUGPG1uBqom+EVVC2/Qia91knNQnLTHQ29YRo+/5KepafRnabgYPLM3X5qjTp2HppYSWEfwk62IiaCxb6mE63ni+vxNiwaBpOSPujA2+gqouXBHogMl42y61uz98F0n5adZxarU2ngj/FkwTD3ud4=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by IA4PR10MB8253.namprd10.prod.outlook.com
 (2603:10b6:208:561::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 6 Oct
 2025 15:28:38 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3%8]) with mapi id 15.20.9137.018; Mon, 6 Oct 2025
 15:28:38 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/5] test: nfs: don't require a locking daemon
Date: Mon,  6 Oct 2025 16:28:25 +0100
Message-ID: <20251006152829.239100-2-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.51.0.284.g117bcb8de7
In-Reply-To: <20251006152829.239100-1-nick.alcock@oracle.com>
References: <20251006152829.239100-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO0P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::9) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|IA4PR10MB8253:EE_
X-MS-Office365-Filtering-Correlation-Id: 91d9bd1c-83b6-4881-54b9-08de04ed05dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P1qX/cuM1ZKHQP0zXuxtYLWREMekPHH0UEodCNwKG45lwvgkhxE1FoEB1Alr?=
 =?us-ascii?Q?8gQ9m1uMiziKOy1gp/YPkB4rWu3Ipf3DiVXjXTxPxG8hxRlb++ux/Xv2oLnj?=
 =?us-ascii?Q?r52yLSLYk5kvt/BEe8I6gWq1gUqcxIT7TQlEJVH713UPYUyePCTbuQWrL9ib?=
 =?us-ascii?Q?Giqagruln3D2GAT8dXs72kAHo3qM3nFXGQOhCfEmMDHR0Zj9ASUAtJjcg8lJ?=
 =?us-ascii?Q?4tk14qQHuo42i1qQueRg8eSaXT6hsuiB/BM9porw2m6l/Gv5MMimYwXCneRf?=
 =?us-ascii?Q?TC+j1hWT8M14tIsKl7rV6E710qV2CLGjUAQdKnr2dM0DPmhcIufc5RN0GGUp?=
 =?us-ascii?Q?dauCpfpmwh5xiwuJ3/fAhM5rTBUlUq5rGVLcUUwetxSnDK2GaFgjaoa+Ujfi?=
 =?us-ascii?Q?wXBwxUy8EEIfj+2zqBeSwfiXQMIWTioLJKfegE8ZBXWH1hMDm1YEc9EAiQkx?=
 =?us-ascii?Q?NiOCmcQJcO7jxwvdZ9oK7o2tBn9mUlHpQYICORM/Kb5oSdeBchu6fYsceIIb?=
 =?us-ascii?Q?WrYZHzxw3E5nRn5t+gW7zhEtrWiHvHFi1y3r0D+Jnqk0A/f1yM5UK6grWFzH?=
 =?us-ascii?Q?4mRtZxB7PI8JYwWj0U7m2WvK6jQz88geIB8y8Fo+kqm/d8S1E6bJXIyQepcr?=
 =?us-ascii?Q?ihdo2IBe9ZQZ40KCLQbybOikhlbhJV+KAnAZti2xBwFPXDUlwyw1F9kQ+xqh?=
 =?us-ascii?Q?yMgiVrLlpeBwBTpZ/u2ITfr23ipdZHheA+t0Uj7aNlyCsuKq1CvbSXuIdSdx?=
 =?us-ascii?Q?31ujaMBbA3sMtiEz2NhJvtcH4eLszLVymoCrO8yhAPtKj2PyyV76U1naLLjN?=
 =?us-ascii?Q?hzONlYSMUbmx7tRR9lnaBKGnn4CDHYI+bDgvnEAkeSdmWvUWNCFB4j41TxA/?=
 =?us-ascii?Q?uwcoVkEZV8wPjaDZnuZd94vgk5HavcWU29R19oGfP/esI5+UFmGkmZ+Qm+y/?=
 =?us-ascii?Q?7RggA4VYYD/+ucwo7soBED9sx2ThF3XyAVcLeu7mrU/9Z9b90PSKJkaOKb8C?=
 =?us-ascii?Q?7CxuYouquc3sm4zpcwp00pvJIRRnbYQuMHsYKUJZGO23Za4qqoSUe3nd1xKH?=
 =?us-ascii?Q?hlFsInW8MUo+LKswrkYAL/o97LtKd0aXcA4CeTzeVm16kFQTsQVgNA/qGlqw?=
 =?us-ascii?Q?B7T3e9azTnueNInmGx55xHXbkdin/ejzWO5BodHo1Q1w1QV4gvcdj5XeQV1X?=
 =?us-ascii?Q?306FwBtcvPFWvLr/HMZaUyAGVeI+d96+exZ2ahniVZ7yVE5ETLtOnyLOu8mf?=
 =?us-ascii?Q?qIZ1spdnAzeItn2sniJQ6eWZGqoScHLWgvRe3DhmQk9zrutJW2/xwfjF1Crl?=
 =?us-ascii?Q?g3MUsavUsirZ8WfTBX9Puju8mEbX83ghSeq/ExnHG3lydofCQecYRkDB+F+z?=
 =?us-ascii?Q?cDZ8uqRy8YJyf6BTT6cykivzUhTkBXtDSvZV8ZaJH/VnyQwLCBzfkr1EAP3y?=
 =?us-ascii?Q?0M0xWTJSBAHpyJO5cU6IMPhfvTkyTpJX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C4G2UMdWmBMLRf+VkcACNnCLgseeY/iG6OHscAtIWID6hT/2aYAc3Zje6CGW?=
 =?us-ascii?Q?tGrPQi3M6v6oNESi3ZOjSeSf9qKfVKpA2e+1qq9m9xNvN7Cvua9pYRgagASY?=
 =?us-ascii?Q?P9BDbKI6VGKa8EfLr9zy8rC31dIJltwWH0G4HiA6t9jCXVUMeLPMZg/Icg+w?=
 =?us-ascii?Q?/pHQdIUGVAln0HUxlQ2eN00a5f8XqO5jFyGGXtZ7zEHPdQjtPHqZw93R4FgZ?=
 =?us-ascii?Q?6lPoOfn8lGN/sDf+2H/LSuYB1sQHKPfaNMMBpoqn13YOgytUo4NINZMSx1YA?=
 =?us-ascii?Q?P6CpYL3vZ1SqQvr/bifEaLlVxDKBdO9MaYuZDNCQMALhE5G9AyEYq1ZnjOhk?=
 =?us-ascii?Q?1k4Ws35ZxVX7OZWI3pIZvzUpmn9ajNnek3a6GtTQgBx7LGFsL6EaqGXRw8Ey?=
 =?us-ascii?Q?ya6eG9+YkIj8jzzlWKIPAVxiz9xKjWQdBpjSWUcyTcUOWLwhElGJK9cJosVH?=
 =?us-ascii?Q?gxI1X0myhbk9ZddpI1X/KEkZ94fVowjNJbnUCUbrqYSe/XJFHnA8SJQR3X+U?=
 =?us-ascii?Q?CGY12qjJf4E7bwyvtxEWvLLniaakI0GXB3eob7tMQ4EZ2CXI6PaGHUPASMcH?=
 =?us-ascii?Q?x/QYbJSOdWV11vFTpam6ZyoXGS1pMvg/R0zHIrDJh51mqlnU9ITbTb718rk1?=
 =?us-ascii?Q?np4AlHI47HGBz6B7R9QfTACMjJqnV56ZuG4mBpJT0YS79rL2O2cMHXT9lMGS?=
 =?us-ascii?Q?iixwohG/2h8TpZGoIAMDI9vTN6pBsiq9/Ig6TLDKRf96nq9M3j0ewXp+CHFs?=
 =?us-ascii?Q?R5RuMWkEB/DbG8nlcYnegeU12pHmp1jr3GmDq24q91rVU3ZJYq6Nwe/0C+SY?=
 =?us-ascii?Q?ZdJM+0/oWQTeNyOEsCmzxiyGKkka/WF15IMZxI3k8POca8nFP+WYnH+4lVlI?=
 =?us-ascii?Q?dcF39s2caY5QHmgydRf4FDKKy10Ff4oBwWuiJn2eNx2uXYg7XhEUZcT5hsXk?=
 =?us-ascii?Q?hZ/1YI/0JsL0IyH4RL7ZVmy5eFk41501mL0MaVvzb5v/q7h2MccVqr25Tsx9?=
 =?us-ascii?Q?/lCo/jqWpVyY6lvqSfkaIVm/2tOxpxx6d0+8IV4PzXGq3DPH6MBcWX1Luoon?=
 =?us-ascii?Q?Om5oI8rH+hCp3plt6O9cPLmtOHQqJrBIT0JKB/xNALwQ73VdbpxpyF/eVtg9?=
 =?us-ascii?Q?lEoe1jBltmFbqqg53i8PL4Fz51OGlziW3LwOnaXXHzKUsYMRa2lgtQ3PrQGe?=
 =?us-ascii?Q?EItxS120DLkHde4skDhyErUlvH3U3LB8n9n3IZfKHQzgwYZjWw7fh3imSY1T?=
 =?us-ascii?Q?anMxzN/uQd+9FjJGE+g65odHpX4qvhfOc2m6A+1ca/cRTppehMy2Ivqsr4Vr?=
 =?us-ascii?Q?A4/77LF2GBD8KEOllGD5pyytP0GZIzcq0K1u2rENyZXEs/G6XhoN3ehMaY4m?=
 =?us-ascii?Q?bHqlue9qBOeEVktMAm6/fwOiX4QVaOuI+1VmR3DLZZpVdCz0oH1Fv5E5vVVm?=
 =?us-ascii?Q?oG7ToY+Yrwb2jnYAjm6z0J+Z0+61aGkzwj+bp6ifTy5tOuHZgowDiN7RtNql?=
 =?us-ascii?Q?HGZGxlK4qOrMkoSa52V+tXAYrzOPyaBOxTZZ8ompw770Um3MvFDYt6Z3db4R?=
 =?us-ascii?Q?nfBjIF5f80U6KYgWjutRZ9d9Rq5O7/kWVIF5f4HvHm5MP3q05W/s9oPbb4MT?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oa4nvKgeXuWX5+xyBWEOBrfrBjiFUSUrkCEiMnifS6+RMlejQS/deJ37ldtFN9mgjEqBeEnjBWhltrAIRehZONk8VCBYnKFElYNlkgtxBbcPWJsgi7hRqUaqWjGHTSlhWk+iOtgPNmWbfLkJnDyUExf5orbicqrK6ZaFa8+y02sK9q3rirHlL/Mi+0UYH53DQAlYERHKiH7P+n9A/jhGTl5PxmFOTEkcbpN1qiFTMjTNO+7yA+lQRo9dI6O1lkwYfFmg0pe7SmAXu3eKVIx4C81DKSQVEHGERSfYoOOPjrQ/lX4Aw0wyOpUS2L8LMO00Y7nx23DgvUL7zIHGuE/PiK7F+tvcYcEbo2i+NibhNI6j5UedSR2+3DEfe9td5bgzp7DzszYlsorI32a3f1DWx2tIOjsJQOecJahYBEauKEEhYwaSAZkpjDPpZQi+QeHdEksZCFmNjua2L7YIMLGC2tTlOJFvN0Mt1td9s5BR+4TTmKyWj6tdmJj5D38gD+m1cFXPB1K8Ca5S+xZ4Ke+rPp8IxngdKNuUuZyeRogxEYG+DP6qOP4ntv4CduMG6WxrCCOrHE0LctoModX5EkNBAYIio6PLHjnzeT8xnCODVPw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d9bd1c-83b6-4881-54b9-08de04ed05dc
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 15:28:38.6802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JxjbjJyS80lJY4I86H51Ztfzjl7/CVcQ6uq6SnBBKzwATVd+eMi50PfrwCpHoRdeLkXNyscnWGvYVMDRYyKAlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8253
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510060124
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMSBTYWx0ZWRfX09dQI2QVkKbL
 G5P5L6Mb7/YUyCrPAj98j88+95YmbMA05pxI4K44B68fvMgUrBb2jRIumx7/okQMhwUawwYq1Po
 cYMT9SABoIdOz24otKboAakFTuJf0EljE42BqkZvU5aEBeki1hycs76m6Yp0uzyGZg40STaOMqI
 CATrP/HUKnxQg4d3062kRDpxtv1jqNqa3xYTQzgw58d+ZW4ckmFI9qiCY3b6jB3emP9Yg/m+rXx
 DT3w0tAFVHRUG+C0aFaUy0Ls5FEte1m3FJwzYdtBPmF6MT3GwEDD1Wu7RqJIrvgXm4zoNZDjsQW
 zI7sz7hwCj4SMuG0H9b8rNbQ8PSpJvDTEl3/wn525NR69NE/9jiGLs0APe8SHSYZ4BC0qKsx4Go
 ml5dlpgDKWLn13LRDDB056lKGI8lRR+r3g5v9U+Re9IpJYaV5EY=
X-Proofpoint-GUID: adXTrf3sR9Kgihr_yR_ivUGMiEjWo2mV
X-Proofpoint-ORIG-GUID: adXTrf3sR9Kgihr_yR_ivUGMiEjWo2mV
X-Authority-Analysis: v=2.4 cv=Z9nh3XRA c=1 sm=1 tr=0 ts=68e3e02e b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Cg-HSOLnu_sJ91T-7D0A:9 cc=ntf
 awl=host:13625

On modern (NFSv4) systems, there is no guarantee that statd is running,
and indeed it has probably been explicitly turned off (unless writable
NFSv3 exports exist).  This causes mount-time warnings that trigger test
failures unless we disable locking.

No DTrace NFS tests need locking, so disable it.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 test/triggers/io-mount-nfs.sh | 2 +-
 test/unittest/io/tst.nfs2.sh  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/test/triggers/io-mount-nfs.sh b/test/triggers/io-mount-nfs.sh
index 338443eb72240..71c83103075b8 100755
--- a/test/triggers/io-mount-nfs.sh
+++ b/test/triggers/io-mount-nfs.sh
@@ -18,4 +18,4 @@ fi
 mountdir=$1
 serverpath=$2
 
-mount -t nfs -o nfsvers=3 127.0.0.1:$serverpath $mountdir
+mount -t nfs -o nfsvers=3,nolock 127.0.0.1:$serverpath $mountdir
diff --git a/test/unittest/io/tst.nfs2.sh b/test/unittest/io/tst.nfs2.sh
index 41a7a465868f9..87452d3a3be10 100755
--- a/test/unittest/io/tst.nfs2.sh
+++ b/test/unittest/io/tst.nfs2.sh
@@ -31,13 +31,13 @@ systemctl enable --now nfs-server > /dev/null 2>&1
 mkdir $exdir
   exportfs -i -v -o "rw,sync,no_root_squash,insecure,fsid=8434437288" 127.0.0.1:$exdir > /dev/null
     mkdir $iodir
-        mount -t nfs -o nfsvers=3 127.0.0.1:$exdir $iodir
+        mount -t nfs -o nolock,nfsvers=3 127.0.0.1:$exdir $iodir
             $rundt "dd if=/dev/urandom of=$tempfile count=$filesize bs=1 status=none" -o log.write
             myinode=`stat $tempfile  | gawk '/	Inode: / {print $4}'`
         umount $iodir
         # flush caches and remount to force IO
 	echo 3 > /proc/sys/vm/drop_caches
-        mount -t nfs -o nfsvers=3 127.0.0.1:$exdir $iodir
+        mount -t nfs -o nolock,nfsvers=3 127.0.0.1:$exdir $iodir
             $rundt "sum $tempfile"                                                    -o log.read
             rm -f $tempfile
         umount $iodir
-- 
2.51.0.284.g117bcb8de7

