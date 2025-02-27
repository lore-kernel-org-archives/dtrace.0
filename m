Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFD0271277
	for <dtrace@lists.linux.dev>; Thu, 27 Feb 2025 21:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740692661; cv=fail; b=gCVOLclVyS/icSzU4Weqx6fY17Zc6A2m1M9KDuYHs0TyHEcIwD3/Wp2Bye0SQANv5Y+2iVlHjSjPfB4OGvC4gXFw4rV/TcV7YfdAtpUuKECcV238iPuvLsYpLGsW7zQspAUq2wIbJ2aUTH02rJiy6tj4K2FLMXq13urCUEo+TUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740692661; c=relaxed/simple;
	bh=6fDZVPMSry7YuhepWacv+aV8K9ovP9GxFGMf5h2LXpo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EFFlpZdMSiAX623qHEEA802SAMKJJK1PUxxTKcg5LKpmOODQtJLVCrI2sqnqE0Wo9VqG8TYe8ROMh5fyRhKKZKQ1iacSEcQTQ1jOc7opH/tpm7e0P8vIPEaehX1ZENme2CELO7eVIe8KQggso6pX50Jr4U3M/R4HRNPsr0GcVFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EdFm+Bv0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cB8y8OAE; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EdFm+Bv0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cB8y8OAE"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RJiXg4016373
	for <dtrace@lists.linux.dev>; Thu, 27 Feb 2025 21:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=hcpSRyX1aeu/L8m1LIe2xHAmkqMlNqOK7Nyl63h9G1w=; b=
	EdFm+Bv0Q0zRBJpNlFKpIWafbT21NKLuETbHEK5zqKqHMuHDw8ef6JOu7cmB+ZEJ
	ILiVFAQw9MWBSdr/hEZNQmOicxZkRSlHAJ4NzU8icSfQJcrpYpJPh0CVAAkQ3njU
	/e9aEA+KHLyFMoGnhcleDGTcojKs8cJ0L82buMRePypTtww3kiGczvuXE+ZolVqi
	2Z8jw5NiTd7MCNMPThr2D5tQiHJmzoKcaX8l67zc36wFCPpHzeeQLf8FZvBnB0iT
	hVTTfQBIiePl0G1BXOyoYTZEp/WzR/fHCgVyBbAKf7ocin+6KA9PP4I6yBvWppQq
	Zw1/xsb8/7+lM3ZrWI+ylg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 451psecetw-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Feb 2025 21:44:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51RLGFL9024543
	for <dtrace@lists.linux.dev>; Thu, 27 Feb 2025 21:32:19 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44y51cshn4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Feb 2025 21:32:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwddNkJQyKfET/puTpUPL3z71UfdPnC7IAEnLsSGNf7WeojBTJ7J0VKAjWVFkjoZuKzgAB+xB0Pj5YTHtkAAyS97OdsxlsoF/FimLUbUOoVBPZ0kk3NJQKacIa6qpV5rqbhZ8yxoJPjPifxXBh7D76EAdrfKOLeZaSfyNjAujWtVjjjOn+3lB9R5tkKZr+HiMEk+yxWyVFm843CxPWg1iYWJ+ROuAzfnnjTDbFm5ehXGEUfzm9cHkhHbpCAKnvtlw2DfNw2GVfWq0FyuWlSYjBDFDM1qq/RMleknroyxfcCcNX9/D2XdQmuTPl30rIvTePdIHj/6pufQLSJkR4aZMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcpSRyX1aeu/L8m1LIe2xHAmkqMlNqOK7Nyl63h9G1w=;
 b=x0S2ypHsc8inO2blPJ3cOOC1yHqkt9KHbgFy5xzmQDoobbKTMw6xzKXfxUiQLzQixpbNCge6NoY9VpB9UbyDf0a7vOfwW/ah1ZIyg8Wy/KOLTD6RkBUB/cJnZRUugJvdIvuiN7ED/ilbw90WAjxY7JY5DYMZeZVWZ4tmbsJZhrk3fmfBnlUiiBISo70Sm4D8KcshMrZnyPIUYMEAlLdNnE2vxfUoE32toGmT8j8LmKcyj7uqgwjj89OgronS40pm1N8FJYRRSnglscdrfIQSYwBElbAp+lbDvDRGD9K5qi242E7G2ITyLHF8KWJmOVyH9T51jAuAxc74LK4RZxK9kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcpSRyX1aeu/L8m1LIe2xHAmkqMlNqOK7Nyl63h9G1w=;
 b=cB8y8OAE36BUyR2dfe0V2ijNv4Jbei1dlog7QFQI/fKdRgU1ng0QkfWFutGPzux31QUNXiK8xiVIKcwkc3uDjyOcPOTMSlTq2J/1Z6VKnsUkt4VqB2Aa/gwBUXLA3rJ1rxHZ+Bzc08uHHrpZ8FeoOoSjWdFqjaymgqH1tLNyX2w=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB5674.namprd10.prod.outlook.com (2603:10b6:510:126::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Thu, 27 Feb
 2025 21:32:15 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 21:32:15 +0000
Message-ID: <a3f5e5ef-1b3d-304d-4a0c-fa0802d96864@oracle.com>
Date: Thu, 27 Feb 2025 16:32:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] test: Allow duplicate usym/umod/uaddr if for different
 pids
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <20241205191318.18587-1-eugene.loh@oracle.com>
 <Z3xFWS+WEviQKMtl@oracle.com> <Z3xq5aJR/HQjQn5d@oracle.com>
 <Z74xoR9U_q749CDF@kvh-deb-bpf.us.oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Z74xoR9U_q749CDF@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:254::32) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB5674:EE_
X-MS-Office365-Filtering-Correlation-Id: 928d212d-13bf-4147-1c7c-08dd5776343f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a0xMUGNjUExhQWZJQVRjTUVBM3h1cHhGcFVzaEpDNzQ2QThvbTNEMXk0RDRl?=
 =?utf-8?B?ZVJoVEMzYUI1MDRrWU5IRnQxZHdwV1gvU3lmSFRSQ3h3c21zT3B1NkJtd2Jn?=
 =?utf-8?B?ekdXZ0JpcEt1VzB0ZncrR0RubVdtVXkxVW5ZZnNGNzBKTStDWjV0WXRNVk9s?=
 =?utf-8?B?WElXMUw1eDNodktVUER6TGlpdTd6c3RYaERRSWQ3M21CNkxoV1hJTTlmaVNi?=
 =?utf-8?B?Rk1KVXF4N296bTNUMThpNEdldS9xOTljKzdRTnpPaHYvcWVDOVNiZ1RBc1dV?=
 =?utf-8?B?TmpYWWEveUxZOXJCUVJvd1dnWXN6dHhkWFB3cDVJaWNIQWR3UWxYZ0xKQzJ5?=
 =?utf-8?B?Z2JLeXVFak4rVkJvQ0pWT05nakxka3RSa3ZrNW5JRWhqTjRGT2p3SHowMWk4?=
 =?utf-8?B?NE1oOHFLcGdKdTRFczVtZWkvWkVENmtlTkIzVjdCQzFQd0g0VFhBcE42UjUx?=
 =?utf-8?B?MUxDSmM2dGErenFWZDM5WUlXSTJhQlFXeXRPN0kzR0pucy92b2RzTXJHR3BF?=
 =?utf-8?B?Mm9UbFFYaDlZV0kvMy9LQTZJbFgxTlBwUEQxNUhzR2RNWERheWFqaXh6a3Br?=
 =?utf-8?B?ZklBelRZQkNLcTNETW5ZYlg0YnhxbXVOK3FjckhTT0lWenRoT2ZnMlZhWVE0?=
 =?utf-8?B?elBUVEJSK2lhdEdDZEtneVZVQS9tamtDai9OMWxsSk14UWNnRTNCd0RRcmxG?=
 =?utf-8?B?Qm5lVGs5WnpaZjUwNU56VTlXMVlsT1MzQmFQOHNxZkhPU1hXWDJQbFdxb3lh?=
 =?utf-8?B?cFFKSStsZXlmR1ZMVFZUdDkzaVpndHJRQnJ6NFZJeW9pb21vMVEyWkkrSzdZ?=
 =?utf-8?B?bFFmZWt3ZWNNUnVQRmRlemtvUUphNmdveG9oVGxtV25SWmZ5VlNFakNIQ080?=
 =?utf-8?B?SEs0S3BKZVNUWkE3dVpjYkJ2SDhiZTVla1pZbXYxUGFxd2RPZmZCRSs2akpq?=
 =?utf-8?B?OFliWlNhaDZkWDQrOEJ6bDRicFp4WGltRUhSZy9tOE5vcklFOGVLcjFHcnlI?=
 =?utf-8?B?dThuMGN4dVBrL1A2ZmFYOENTRHJXVEs2OGU3cFVNdHFGMlg2Mk5GcU9CRmVB?=
 =?utf-8?B?cHNaMEl1LzFIbVFUankzbWRya0ZnVGdjbEZ0YXlJMkNrQ1FWVEdsbXhwTWFN?=
 =?utf-8?B?ak5XTkNJQ1BqcXFoa2x0WXltb1NCN2hZMFI5d0Vwd2pjVVhpQU1LMDB4QVJ6?=
 =?utf-8?B?WUdFcG51NW03T1lpUER5M1A4cThQVXJubGlPN2ZmUGVIa001dXAxOXNONXlk?=
 =?utf-8?B?SkZETlFtVUEyVTByNUtvMmtTc0xUcGpiaUFYUTUveHk2b2ZWTFFUMHVkMW1V?=
 =?utf-8?B?WHRsWGRrR0ZPM29UMVdTVzZ0bW0yTXNlb3dEdVgrQXMxcFN2WUZVeTdubmdv?=
 =?utf-8?B?eHRlQlRYQk5wZUJrNGR5SWFTVlA5SDNEZUMxV3VLT0JVRS9zdFk4YUs4Ni9j?=
 =?utf-8?B?Y1FWYlhFS0o0WElEVUNIbElsaHpyaFJPdnRHTlo3OFJwZU92UzI5OFQ4bXFk?=
 =?utf-8?B?SG1xd3NMcExEZFQ4NW9RK2ZzWjV5ckh5RDlkSVJubUtCVTRRblUwZXpnSGpy?=
 =?utf-8?B?YUVLeFhWaDQyZTVwS1FkWXFhWHZ5dnlQeG5XMkJSTjJkRTl2WDgzM1NQV1Nt?=
 =?utf-8?B?SW54Ty9jbDN3WWU4MWZuRTBUbHNlMTBMdkVQQUMzdHoySmk5UmpRbFdaZXNj?=
 =?utf-8?B?UXpnd0RSRWJvTjU2dTRucWJrdWVZNVlKNDJhQzhFdFZpZCtsKzBET2xScHBM?=
 =?utf-8?B?NlFpamc4YmgxaWFzM2tNRmRzSG8vL2huWnUvTWRQWkhvTE9jYk1qWTJmTkdH?=
 =?utf-8?B?ZENZR0tLUDk0ZTlOWjFESGtoeTBweUlITXQvbGkrVnFSVmgvWXJRWllYcmhN?=
 =?utf-8?Q?4k4oIbJ2+64l6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ulk3ck5TaWlONWtqWFZPcTIxVjJBbnlhVHFDWkppTVFrcTNmZjBaNjRacHNV?=
 =?utf-8?B?cWJ2NlArTyt3K1QvUzNGUmdETis3SXQ1QktteEVGTE8yYjZ4WjFpVFZ3ZXh5?=
 =?utf-8?B?b2ErQndNYWQ4VXUzMitHMDgvTFNFOFdHbi9kbmQ3K2NhZmhDM3A2blVLUm5j?=
 =?utf-8?B?dFhqTHo2ekU2OFZXRnI4citPR3luenBoVUxaRnM3SlEyWGNRM1RYWkNGalZp?=
 =?utf-8?B?NGFybjVUeTN6MzRiMUZxNFYwUWtkNXNGT01iZ1dQTzFRK0VDTXlUVjRGc2Vh?=
 =?utf-8?B?by9IV1A2MzgzRThaQzlVTkxYT0lCTnl6bzNLRWZuQmw1UkhSODlQcXV5bUU0?=
 =?utf-8?B?ZFlpRzFEYWhPSDRiVVQ5SmZuN3ZOZHdnZm5aZVI3VUNIMEZqWFJWSVB3c1Nu?=
 =?utf-8?B?TXZRalJIeXkzNUh5bnVhNTN0YXRheVZHWG01emlWL0pWZHlLdllDME02NXpT?=
 =?utf-8?B?c3RiRGhUMUxtdmkxR0Via25RSjBaa2hvUHlHcFpwZHlTcnhuTElXY2dWMXhW?=
 =?utf-8?B?SlJ2cEVySzRqUUMwc2lLcytXeTR6L0VmeXVDT0xZVUlTek9yVmZiNEpHQkg2?=
 =?utf-8?B?b1NyZit3dmZLajI0L0pibFZqN2duUW96dWZJSFpmeDU1QTZBeFJud1I2MkV2?=
 =?utf-8?B?TUtDWWxWMVZYOXRiYWJUazdtckxlR0tMS2ljRzUwQzRySE9tbU9tNG9sRHVZ?=
 =?utf-8?B?QUp2NUVJeWp1a3Jmd0Y2YndHNjd6K3lWdWROQ3BQcW44SEtBVFM4WWxrVmw1?=
 =?utf-8?B?WHJVQkFPMklFMUptUDgvL1V0UEt0ZjdrcEFvZU1PYUtqSUJLVUppSmgzZEpp?=
 =?utf-8?B?SWVxZDNSa0ZUMFBPUlhZOXM5c3FDUkluYWFReTJFamNvbU1TQTdoU3gzNWxV?=
 =?utf-8?B?eXJvZmtwWE1rTVpGSi9SeGJPQ2lWcUt5eUI0dGxFR2NLRmNNRjZTSEp4VVpV?=
 =?utf-8?B?RHprNHkwSzZzQm1lSnR2bnNpMldNd2FacUtRQ3R6aWMzNW1TNkFQLzR2VVpt?=
 =?utf-8?B?NFlZV2ZVWjhoL2JXZ0pibnB1RTRXVFF2bnMyU1g2Nm1hOFE0ZnVuN1VLdHVN?=
 =?utf-8?B?MGdSMTZCQ2wvbE8reGdqVHVCNHUvUlFJYk84RGs1a1lIRjZkNjlRaXNGdXFN?=
 =?utf-8?B?ZTljK0JSVlZUaWdyb2ZQUGxrUGNIYXN2Uzl0cWN4OVhOWDRybStITmxsbk9P?=
 =?utf-8?B?RnFaeGd0RC9PbDY0bzcwdmdqVjRkN1hsZlFFbEs0R09JbVJYZklmNU41SS81?=
 =?utf-8?B?RXBGWHlENlhRWlFhRmQwT0dmazdZcHZsdUh2NUQ5ZkMrNi9xdGZIdm42Qjk1?=
 =?utf-8?B?KzlvSVlzQy9xdXJPNU9hM2szYTA3aHUzNWM5OWd1TTJ0d3B6RHBEdG1PNWo5?=
 =?utf-8?B?ek1xRWhvQzNjdnhkT1RhTm8ySUlGSldYZUxLZWZPTEpQYnZSZFFKNXdTdkp1?=
 =?utf-8?B?MlJKeG9DdGR0akxIQW9PbmJUUld2R1IrVFNxbmVtUXNpV0x5R3NoTi9XdWFM?=
 =?utf-8?B?dGk3UWFhNUZnclRjTlU3azVTKzNVbHhpbFR4Rnk2K0psalFaVTlVVHR0QkVU?=
 =?utf-8?B?Q2orTTgzcStVM01wVTA4TmFYRlM1K0xBSEFFNkt0ZEs1U3FvWGswWmhlVlFS?=
 =?utf-8?B?ZVNzdk54U3VnYmNuMTMzY255RmdDM1ZTTFdaYk83QVBOdlVSN2VBNHh3Rmxi?=
 =?utf-8?B?Vm1CTjZPU3NXOFZuQzYvNUNidXlCbENNMkQxcmQ0U1p2a3cwOWlIaW5ybFA1?=
 =?utf-8?B?NGZTVW0rb0lSeE40MXIyN2FUbjhIb0ZIa1F5cHFCaHpUSTVaTkErdVdlcjZN?=
 =?utf-8?B?d1R0MTQ4Nkd6alQ3OXhBa3NpRGtlMVFta3p6cWV6WVk1RlIyOG0xNURKNFN2?=
 =?utf-8?B?Sy9VbUpBWXVhSVlHTU5xQWNuT2lkNVYrQVlmb1NQQzc4ZTl6eGdUQktDWkND?=
 =?utf-8?B?eWpDUUY4aHcxbWNuUlg1a3UrZ1laYkpGaCtvSDByQU9FK1loR1RXYkxxRjdO?=
 =?utf-8?B?Z2gzbHV2Y0Y0bHpSR3R3ZXFyLzE5VmRRcXhEZzNNSnVYa252Q0g3d2wvK1Qr?=
 =?utf-8?B?dUR2V1dZVGJURCtWRFBKbVB6MTRSOVUrV3ZiaHc1T29Ed21CUHRTbVBGRmFR?=
 =?utf-8?Q?82FpSX3nusYxpoJJJ3bd2iSuR?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	d5kDo1pptTWvQjapfp5cLXTZUroe/NqZVQZuRF31fPko9SbhLKNZW4dRWy+5ncRRlkR0xEbj3NjUc4Xzo3sR1T9MbYM3b0MxAQxFxt8iKpBH/POD75ea2zXBQW+z2i8BGPlUtH2fFOVfvHeGE7Rfb8AF7EATJ0XmGcBJatYhnkpydGde9LnWSIdAP3C8kOs9EZw7EGaej+hXfR74y4T9epXRvzyutqZ0Ztzkh3kr/7LH0xfXjjremfBLrSmHxvtECCHGW616icLte90r69tfFR7sJ5Xrp4CIjxIXkDIoiiHT7mm8PfnPMh3SJX3BCrr2gO6a6F2liu96tS+sxMzH9/jdBytuwuLTu3ba7hnqVESMiAOLL8Akfv7GunmQSHk0UeYrMnHfUAXaAcr44aFuKiXWjFISuRCUdID8vRyOFB9/YgJa7lzwuVuoij65AkAnmkSAZzPw5ZohFCsxv5L6P/pBve9W5+zxG7gdBmGTzxcFnzRrYnecMsxe8T5MABHnuNkBjvBa6DrDO4HE8DzEBLyMInspOdLhSZV1KhBH+ioee6km54iLkNikPLcRHC6o+LuGhYEAWI6aQLkHY0DlWP0ZW1H4AW7jcC9GWjhPgRM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 928d212d-13bf-4147-1c7c-08dd5776343f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 21:32:15.1927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZtnQSw6ITOVsJwfhAEZYGQbkLbaDpVldUqub+l0CsUOLSIMdH+viBogXsgdGGK/tBxBBxpc3V1RkFEK3MAzleg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5674
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_08,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502100000 definitions=main-2502270159
X-Proofpoint-GUID: J8x-org_BZgLFLqqNCwm72I_a0brHotM
X-Proofpoint-ORIG-GUID: J8x-org_BZgLFLqqNCwm72I_a0brHotM

On 2/25/25 16:09, Kris Van Hees wrote:

> Eugene,
>
> Can you re-check this against the current dev and ensure the changes are
> correct?

This is interesting.

I guess what happens is that if we hit something like usym(addr), the 
kernel only knows the addr;  it's the consumer's job to do the usym() 
translation.  E.g., when the usym(addr) is in an aggregation key, the 
kernel's copy of the aggregation is potentially very large (many 
distinct addr values) while the consumer's copy of that aggregation is 
much more compact (many addr values mapping to the same sym).

Anyhow, dtrace loops over dtrace_work(), which calls dt_consume(), which 
calls dtrace_aggregate_snap().  When we "snapshot" the aggregation, we 
first call dtrace_aggregate_clear() and then walk the aggregations in 
the BPF map.

The problem appears to be that the usym() mapping changes.  Why? First 
of all, we could imagine that the mapping might change.  E.g., a library 
is loaded and unloaded and then a different library is loaded.  But it's 
also possible (I don't know why) for the mapping to fail once (but not 
on subsequent attempts).  Incidentally, the rule is if the translation 
fails, we just keep the addr value (rather than replacing this addr with 
the addr of the associated symbol).

So what happens is we snapshot the aggregation, and a couple of usym() 
translations fail.  They produce aggregation records (in the consumer's 
copy of the aggregation) with the raw addr values.  A later snapshot 
will clear the consumer's aggregation (zeroing out the values but 
preserving the keys).  If the translation is now successful, the "raw" 
address will be orphaned.  It will be reported with a count of 0.  The 
tests in question might (likely) fail.

I'm thinking about some fixes, but don't mind some feedback.

*)  One possibility is that if the usym() translation fails, we omit the 
data from the aggregation.

*)  Another option is that, when we loop routinely over 
dtrace_work()=>dt_consume()=>dtrace_aggregate_snap() and snapshot the 
aggregations, instead of calling dtrace_aggregate_clear() each time we 
"truncate" the consumer's copy of the aggregations... that is, throw 
away old keys altogether. We're reading them back in anyhow.

*)  Come to think of it, why are we snapshotting aggregations so often 
anyhow?  It's not as though we are unloading data from the kernel.  Why 
not snapshot lazily...  if needed for a printa() or END?

There remain other problems -- like, what if a library is loaded, used, 
usym(addr) shows up in an aggregation, a different library is loaded in 
its place, and the aggregation is not printed until after the 
translation information has become stale?  But maybe we can settle for 
getting these tests passing for now.

> On Mon, Jan 06, 2025 at 06:44:37PM -0500, Kris Van Hees wrote:
>> Withdrawing R-b for now after seeing these tests fail after this patch was
>> merged.  Needs further investigation.
>>
>> On Mon, Jan 06, 2025 at 04:04:25PM -0500, Kris Van Hees wrote:
>>> On Thu, Dec 05, 2024 at 02:13:18PM -0500, eugene.loh@oracle.com wrote:
>>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>>
>>>> In 83da884cbdc5 ("Preface usym/umod/uaddr with pid"), a bug was fixed
>>>> in which addresses in the same module (or function) might be mapped to
>>>> multiple agg entries.  This fix helped the associated tests run much
>>>> more successfully.  Nonetheless, tests would sometimes still fail.
>>>>
>>>> Another problem is that the tests themselves were overly narrow.  It
>>>> is fine for a module (or function) to appear multiple times in the
>>>> aggregation output... if those entries correspond to different pids.
>>>>
>>>> Further, odd behaviors can result for some of the processes running on
>>>> a system.
>>>>
>>>> Change the tests to add a "pid" agg key.  Filter on only a few, select
>>>> pids.  Distinguish agg entries by pid.
>>>>
>>>> There are still occasional time outs observed with these tests,
>>>> presumably because the tick-2s probe is not firing (when profile-1234hz
>>>> is running).
>>>>
>>>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>>> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
>>>
>>>> ---
>>>>   test/unittest/profile-n/tst.ufunc.sh | 12 ++++++++----
>>>>   test/unittest/profile-n/tst.umod.sh  | 11 ++++++++---
>>>>   test/unittest/profile-n/tst.usym.sh  | 11 ++++++++---
>>>>   3 files changed, 24 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/test/unittest/profile-n/tst.ufunc.sh b/test/unittest/profile-n/tst.ufunc.sh
>>>> index 243822407..f5174a1e2 100755
>>>> --- a/test/unittest/profile-n/tst.ufunc.sh
>>>> +++ b/test/unittest/profile-n/tst.ufunc.sh
>>>> @@ -11,10 +11,14 @@ tmpfile=$tmpdir/tst.profile_ufunc.$$
>>>>   script()
>>>>   {
>>>>   	$dtrace $dt_flags -qs /dev/stdin <<EOF
>>>> +	BEGIN
>>>> +	{
>>>> +		printf("dtrace is %d\n", \$pid);
>>>> +	}
>>>>   	profile-1234hz
>>>>   	/arg1 != 0/
>>>>   	{
>>>> -		@[ufunc(arg1)] = count();
>>>> +		@[ufunc(arg1), pid] = count();
>>>>   	}
>>>>   
>>>>   	tick-2s
>>>> @@ -52,9 +56,9 @@ if ! grep -q 'bash`[a-zA-Z_]' $tmpfile; then
>>>>   	status=1
>>>>   fi
>>>>   
>>>> -# Check that functions are unique.  (Exclude shared libraries and unresolved addresses.)
>>>> -if gawk '!/^ *(ld-linux-|lib|([^`]*`)?0x)/ {print $1}' $tmpfile | \
>>>> -     sort | uniq -c | grep -qv " 1 "; then
>>>> +# Check that functions are unique for each pid that interests us.
>>>> +dtpid=`awk '/^dtrace is [0-9]*$/ { print $3 }' $tmpfile`
>>>> +if gawk '$2 == '$child' || $2 == '$dtpid' {print $1, $2}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
>>>>   	echo ERROR: duplicate ufunc
>>>>   	status=1
>>>>   fi
>>>> diff --git a/test/unittest/profile-n/tst.umod.sh b/test/unittest/profile-n/tst.umod.sh
>>>> index 45d2b1e9b..7cfe2a073 100755
>>>> --- a/test/unittest/profile-n/tst.umod.sh
>>>> +++ b/test/unittest/profile-n/tst.umod.sh
>>>> @@ -11,10 +11,14 @@ tmpfile=$tmpdir/tst.profile_umod.$$
>>>>   script()
>>>>   {
>>>>   	$dtrace $dt_flags -qs /dev/stdin <<EOF
>>>> +	BEGIN
>>>> +	{
>>>> +		printf("dtrace is %d\n", \$pid);
>>>> +	}
>>>>   	profile-1234hz
>>>>   	/arg1 != 0/
>>>>   	{
>>>> -		@[umod(arg1)] = count();
>>>> +		@[umod(arg1), pid] = count();
>>>>   	}
>>>>   
>>>>   	tick-2s
>>>> @@ -52,8 +56,9 @@ if ! grep -wq 'bash' $tmpfile; then
>>>>   	status=1
>>>>   fi
>>>>   
>>>> -# Check that modules are unique.  (Exclude shared libraries and unresolved addresses.)
>>>> -if gawk '!/^ *lib/ && !/^ *ld-.*\.so / && !/^ *0x/ {print $1}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
>>>> +# Check that modules are unique for each pid that interests us.
>>>> +dtpid=`awk '/^dtrace is [0-9]*$/ { print $3 }' $tmpfile`
>>>> +if gawk '$2 == '$child' || $2 == '$dtpid' {print $1, $2}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
>>>>   	echo ERROR: duplicate umod
>>>>   	status=1
>>>>   fi
>>>> diff --git a/test/unittest/profile-n/tst.usym.sh b/test/unittest/profile-n/tst.usym.sh
>>>> index 634e633b3..8e373b976 100755
>>>> --- a/test/unittest/profile-n/tst.usym.sh
>>>> +++ b/test/unittest/profile-n/tst.usym.sh
>>>> @@ -11,10 +11,14 @@ tmpfile=$tmpdir/tst.profile_usym.$$
>>>>   script()
>>>>   {
>>>>   	$dtrace $dt_flags -qs /dev/stdin <<EOF
>>>> +	BEGIN
>>>> +	{
>>>> +		printf("dtrace is %d\n", \$pid);
>>>> +	}
>>>>   	profile-1234hz
>>>>   	/arg1 != 0/
>>>>   	{
>>>> -		@[usym(arg1)] = count();
>>>> +		@[usym(arg1), pid] = count();
>>>>   	}
>>>>   
>>>>   	tick-2s
>>>> @@ -52,8 +56,9 @@ if ! grep -q 'bash`[a-zA-Z_]' $tmpfile; then
>>>>   	status=1
>>>>   fi
>>>>   
>>>> -# Check that symbols are unique.  (Exclude shared libraries and unresolved addresses.)
>>>> -if gawk '!/^ *lib/ && !/^ *0x/ {print $1}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
>>>> +# Check that symbols are unique for each pid that interests us.
>>>> +dtpid=`awk '/^dtrace is [0-9]*$/ { print $3 }' $tmpfile`
>>>> +if gawk '$2 == '$child' || $2 == '$dtpid' {print $1, $2}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
>>>>   	echo ERROR: duplicate usym
>>>>   	status=1
>>>>   fi
>>>> -- 
>>>> 2.43.5
>>>>
