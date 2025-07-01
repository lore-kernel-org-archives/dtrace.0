Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B3927E7CF
	for <dtrace@lists.linux.dev>; Tue,  1 Jul 2025 19:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751396979; cv=fail; b=rgMcB73ZlJS0Z79NomVF/ljHKcTkA3bRRs5lisW+HCa3cQVcHf1FkPMPiYqXYeha9gHohOIRsQKZ/Ykk0puxs7/VtJHvJVpt5ph5ttOPzmqZntFUZs7CpJ1SnrTCNDjJaoTW2yI7t/Z6Pf9M1Wz5C0onxq0tj7BVC8SMhULWBzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751396979; c=relaxed/simple;
	bh=j3VIXkhgdqUWPYaa9Hx7TT48a/86f0+WBfJcMy7VY+A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VZtQl5z1fCz45qIkWbly91Qnj0AUf3o6ePSGtVkjAAbLv/4zTs7vaR3qqyP0KrYwRn2BKJD1+j6ahFi1nWdL72N815R4P2718K52xYgPnLo9hloHUEsqTVsfubcj8XCpqXYn3bs8UZ0t9J1NkRoDX9te6XoOz15D2n/YAxPw6Ps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XgOGHQwH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tqiHFQjn; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XgOGHQwH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tqiHFQjn"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561Gfl0L027430
	for <dtrace@lists.linux.dev>; Tue, 1 Jul 2025 19:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=TpRpcs6oxvMtAZoOxt9e6tnTYlMRIfmDq/Pjokbbbc0=; b=
	XgOGHQwHL8AtUr0r2AaNG+j/1ueqrEm5+SlX3Tj+Iaw8D5kYdD+Rkw/3fiu1app7
	HoMsmWNVwjJFfVGCI6sizsm2bTVN9aBtXLgsRD6uKVGOwdonpw0BRLGP29sQINPQ
	YqAqix5oqLpm3p1KLSKzQD8MPEAtu6vVq5qimIyvDBYNX5n2HrsBxHbUQs62g6DP
	WCTgUU/zGaxO8ClkfNTPD6R9M0ySUSKLoJ2wjzGvkmrYVIRrB50/qc1QD+L7+a7a
	t2Ze23h+OzBoH5dZ4d7BNyX1i7W64XOaHjoYBbWRWR7ZmadglmYKRXwHRv+D095C
	lN6qQHv1A0zySy60qiIDVA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j6tfdeqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Jul 2025 19:09:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 561I25OC033644
	for <dtrace@lists.linux.dev>; Tue, 1 Jul 2025 19:09:35 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ua7n2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Jul 2025 19:09:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehmAAQtzpH80/4krdURV2gxE696XlOo6HFEQxuHWPDeWK3CvQsyWBOGpMEkuzYoI8syp8cZVfM9VO6/k95IE/M+xcVeA4WOxkFGZQ7F1YuaX3YNhb33gxDDZxIAB0FEosj5Qw+7abuXF9SsdpdRuwp3YmBFcuEXNJvlVTY/NgrtfAfmGuEENXKrjGOOGSHYYh5P4gJ/kF+95GAX+X0CDArcvST5eGMQwq7Af8YoncUIuI+CuWWrbnPD9jHxlilQVTGc8UZaEEoPhYe6/t+J7/IjxPP4CVRwF+swFZlmb4cGXH7PgsbgYZl8GLS4zabz9DWlYnDBmtbBOBH469bCyfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TpRpcs6oxvMtAZoOxt9e6tnTYlMRIfmDq/Pjokbbbc0=;
 b=vqOf35DIOEsyEHHL6v8Mgrnirx16bQjquPR5WN4IczMEnLIjhcoS/f+UqT/6GtYO8BY2Ubni16rkFoig0Wiy4qcfJKKqo45DngpAJs08She2xQYqwiZ1H+lZvWYX+JrEpdihWhGBQH8IZ0DPmUrgQloVJR1pcqeE9ez9GR36iUWZG7+hthYkwPYxc6a+ySKrJZhd9OfNA9sPxomAfwmLWSAgucSYIOvPePZRnG6pAJv5i3+2l5kTJsKTkXn1zaMvuenX/S9QrxDe/Uxm32IiS6R8yxQhm/ous4lfpahBPsUPII3KVmaZYDkSFp+erbUxuwJJdj0TpzTk1voVvqjcug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TpRpcs6oxvMtAZoOxt9e6tnTYlMRIfmDq/Pjokbbbc0=;
 b=tqiHFQjnUcHRinrgbtLOcf47OO6ArgTjCCG0CtrZ/8BBPOkjT3uvWoQkt+Ofv7W16O8YQ7SNk/5NW5FbYz/dXSrCQW3r1YvDbGKJn9wSUOUKXK2wepoG0uMG2nNbVNLnp7rD53mTPEKrOPaF20sfDWGkdRxL/ssJX5FWkzk7DVM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ2PR10MB7599.namprd10.prod.outlook.com (2603:10b6:a03:541::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Tue, 1 Jul
 2025 19:09:01 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8901.018; Tue, 1 Jul 2025
 19:09:01 +0000
Message-ID: <cd4946a0-f529-d927-24d5-0c468119f000@oracle.com>
Date: Tue, 1 Jul 2025 15:08:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 0/4] DTrace TCP provider
Content-Language: en-US
To: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250610135813.15746-1-alan.maguire@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20250610135813.15746-1-alan.maguire@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::13) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ2PR10MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: 598bf65f-231a-4174-1b4e-08ddb8d2bcdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S09qM0JjakxJdWZVSjQrN3JLQTRTSW54T2dtSXNoV2xRc1FBZ1J3djhGVWs1?=
 =?utf-8?B?V0swZCtrcWNWdVh3UW9vNU9mWmt5cUNhK3BJUEZGMHllMTVyNVNHaUFjbkVR?=
 =?utf-8?B?SFdsQWJSZUVqWVEwWStIWnZ6QzBiL3BNbDkweHl3NDVrNHdWOFQ1MGNCMWtB?=
 =?utf-8?B?bzA0dU1UQU81ZTNvNmkzMGVqME5YbnBlbHRLZzFzbFRiclpIeUFmOXVyY05E?=
 =?utf-8?B?b3hROVAyVWZDVWlVbUtaQVNSNFhMcWd2a2dBcVd4MEt3dWZSVm1wZ3hsR2Nx?=
 =?utf-8?B?Q05UTUM1NTM3UzR6akdNQ1JEeHlVc0oxbW50YjJWNHE2VTJNL3oybEpwODNl?=
 =?utf-8?B?aXc2TnRZNDV6SDhpWXRUd2x4eXp2dko3NlNmUmE3TlZnaCtzU1VkelNHVXJ0?=
 =?utf-8?B?R2MxajV5elB1NGdtQk11R0wvbTZMREtVandXUWV4UVZYeFRPR1hKYnJBVGFV?=
 =?utf-8?B?Y3BsK0NGN1AzU2l5SEFzNXNOOUVwT2M1a2xMblZYdWRuZVJUZ0VDbEU2SC9x?=
 =?utf-8?B?Z3MzSVdZbllsRC9EcGhTZTl3TFVobDd4L2pSY1NoZWNZODVFcG1kd2U2OWZw?=
 =?utf-8?B?Wm1xZW9RK3grdnJIOFBza09QQnZtWHlPSHJ6YlByNURpNURnWUlFeDU2OGxR?=
 =?utf-8?B?OEFOWTRsbVNaZ2hPNkMvMkFYVkFab0o0amFqUkM1ejN2Q004SkZuK3RSekx3?=
 =?utf-8?B?RXBYd1ArK0FNcUd6YWlBTXluam10MU8zVk5oS3A1V0tWUVFkSWtIN0JGcWhO?=
 =?utf-8?B?ZjNMNEw2OFVpM3RMUDl2ZmJ3UU5OWERrWVJKSmJQTlBQbEIxWEE4cERGUzJj?=
 =?utf-8?B?amtzSkQzTHFRNVJudUN4MFRMOVpJcEpITkZYUThhckM3Q01XTmlMVlJ4RlJX?=
 =?utf-8?B?Z0NFM3dsUU1hQ2xueEZCbWZIM2ZDc2FjcFRGd1RyRTM3MGFjektlWnBTdVM0?=
 =?utf-8?B?REFMeDdDOFBPazVGamg5VEFpNjV2Ym5OZlNRbDdBUWZpby9udU1RR2xIQzg5?=
 =?utf-8?B?TEgzUUVOb1ltSlBHL0JraEFZblF3dlR1aFpoOUtoUTFMaFVpanEwVHdmelFP?=
 =?utf-8?B?N1ZERkJiQnYvK0NKR1hmcFZkMXhyMjRLOXRHcHVnUGxBaDRNMEl4SEhHZDNZ?=
 =?utf-8?B?Yktob0lMZW1ZNmhOeTJzaFkvdWFWQlJyLzVlQmJrOHcvUllhZEthUHhxRjNt?=
 =?utf-8?B?YllaSkwxVDIzbWtreGgxbUdTU2VoUzluanM5d3RiczBwYzUvcGZnc0NrdU5y?=
 =?utf-8?B?bzJoNjB1ejZMQTdpTHVWOHJURmtNTktxVXdmVExyZEpmMEUwTFRaM25pbEJS?=
 =?utf-8?B?RmZHNjFrUHpFc2RxdG4vR3ZBQnJmRy8wbEI0bWRBV0I3cFlITkMydlh1dzFL?=
 =?utf-8?B?WHR1VGNpaytHRlJLVTBCMVhGRWIvbjA4cmN5bnpGYTdHQ3RKaVVNK0xocWk1?=
 =?utf-8?B?cnpoUlgweG96WU1CNkg2NS94L0hvdHNwZmorOGFzOXpFSVdVOHRlbWFsL05a?=
 =?utf-8?B?UU9Wd3lBM0RNTkFicEpjY2ozcjRWQTFSajNDaCs3VVI0S3Y4RGVyVjA0UkdY?=
 =?utf-8?B?OWcvVS9WT0xXaUd2aVBXRHlhblhFaEpKMzhtNFhIWnZreFlVNWozWlFnTmdI?=
 =?utf-8?B?VlFXc0dFb2t1TGF5VkF0UGZIMmFvZWV4SGdOYTFQVVZiZi81NHpWVDFNNU9G?=
 =?utf-8?B?MHJicTZPU1NpYUtBd3Mzd24ya1FtZUg3WGQrM3BPKzVWamM4T0hSK1JSc1RW?=
 =?utf-8?B?cThOcUJrWXMrUmFJUjlscHpYbGRTa3RFbk0xUGk0SXNkVzZKRG1UT0VDazl3?=
 =?utf-8?B?OWdCNksrN09rbkx0UW52OGl2Tk4vMzFGREpJMEJlQlJoU0h4Q1lQNWtpdk94?=
 =?utf-8?B?bEg5ZTRyS2hka3dtMndkSzg5bmhlRGZCRG8rTk00bXAyQXFhY3Vablc1N0ti?=
 =?utf-8?Q?asRERRxKA2g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0ZHc3BTMStQMGpEUmRrMnFaZi96aWN4UmkwZzNWSXNjWW13bUFFSmtoR0FG?=
 =?utf-8?B?ZWV2Mk5WczR5cGd3c0Q2a0c2aTVTM01JNWk1bjNQWVYraDBlMzB4b0wvM3Zk?=
 =?utf-8?B?MmZRUFUyYndBWVBNVVY4d2FiN0Q3eXhhMUY0NStsRUlGV0kxSHQ0Q0RnV1d2?=
 =?utf-8?B?TVoxRk4yY0E3RDdmSjduUStmSFFMZWhVdDFMQzZINUt6ckdwZzlRSmxGdGgx?=
 =?utf-8?B?K1JTcVVaV1BKYUpUUEp5VDBWbW9ldFpUa1V0UHlYTEpzNlZUK3oyZ0FFK2Jn?=
 =?utf-8?B?T0o1eGEwZ1FzSTJYUUQ2djBTVThoT3hwUzM1UlNCOUNGVko0L3N1WG1jbmhp?=
 =?utf-8?B?ZUNpTzQzSnpmc1VlTit6Q3Q3SHd1MVNHZldyWmFrbDZLQk1vbEtHdTRHcUdx?=
 =?utf-8?B?TEdqd1ZGL1BZUVFCaTl6Z2ZWRUNKLzBSQi9nRGtHRUdVU1EyTDZvOEJyTk1V?=
 =?utf-8?B?TkkwTlN0OXJ2NGc0Lzc4QVE2cWo0VHpIRmhFam0xS1lQd1E4dzJDRTBtcENP?=
 =?utf-8?B?MkhoWENvZVlwRXF0WmhLSEVNaXhzcmVMeEF1Q3lpNGcvTEtkN05NK2tOQXBr?=
 =?utf-8?B?QUxzMk1RM1A3ekh2KzIzUmJ4VitLNmhvQlU0VlpjU1BmcHhmajF4UFFxVE9I?=
 =?utf-8?B?QU8zK092QkNPS1BYa2RkTE14TThZUjQ0dWNtWkpCSzhSWk1sZzlEZnhyc0tY?=
 =?utf-8?B?dmdKTlJEc2djZjhUNG00UHdXTnVEOU1HR0tnWkp4RFpQZVk5bjRVUkI2TlRp?=
 =?utf-8?B?OUFORjJDaGVJY1prdVRpOWRRSnRTVkdzYmV4NmNmUFg1YWpxdDduVEZaRjR1?=
 =?utf-8?B?TDFpcFlMNWZEQS9HL0dxOVNhNzJUNXp2M3FHOEhnczM0QUZtaDhKcTFwTkRO?=
 =?utf-8?B?ZGpmaExpd2RMSTBkUTBUVkw1dXpwR2d4b0o0VkdLd2JjNGp0UHIwNTJxN0hB?=
 =?utf-8?B?bDZxeElaUk5WcWl4RGhqb3BJc1ppVUdkaU44WG5vZUJoSVR5b0M5eURiU3d0?=
 =?utf-8?B?bGUvTnRSb2xIWldjU1d5MnZRbEQxNkRTdjNZbnpTblZ2VWtKd01yZU8rR2Ur?=
 =?utf-8?B?ZnNUNks0bmwxdGtzcUNlNkU0TFZCQXFSVUhLTHdvOHdTVTAzMDZ2RUUyNTFY?=
 =?utf-8?B?QjI0TG0yaE05aWd6QVhydXhGZ2F4ZzFVMEpnZFFXeEZVSTRFQU1FMkg3eCtp?=
 =?utf-8?B?LzhpSUhxa1FYdDMyNUQ0RndUQ0pzWXhSdFFqcVdaMUV1VytrYk5MOFZpcEVZ?=
 =?utf-8?B?dmRCMDFwa2h0djBTNTZTdENoMVMxNzk0cUI1a2dJTDhiTmZySEJML1F1Yktz?=
 =?utf-8?B?TCtrOEhINHU5bWZOa1kwTkxDaVpFZTFSK2VTc2ZLdlU2NnZ1UXpCUURiWWRM?=
 =?utf-8?B?bkhFTi9BbDJ1YlpEaVRSaTR2THdNUUtpZzNhWVJnMk81RGlobzZ3MEg4bUlX?=
 =?utf-8?B?TmdBa2NLQ2tTK0c2V25CU284Wnh5MWNDVnp2M3dRdEVqVmg3QkRqWXBhZVlK?=
 =?utf-8?B?dnRlY05DbVN3aDFUeGVzbVViWGx2UHVNQXV6RnE4OGQ4d1p4WHVMWk1YWkpk?=
 =?utf-8?B?VzN6MmJuTnBrTmdVRmQzVm4yZE9BMHFsUlhjR3FkR1pXcDVVNjArWVRmNVQz?=
 =?utf-8?B?SkFlVWVHT0RhYlFER1ErOWdTT1ZNS0FGbHE4ZTFtVCt2VkJtOWN0VENMSmpW?=
 =?utf-8?B?VjRVVG04aTBuNGJjakNjektJOGVoMHBtTDRBcENBTGY0VE43OHBudStIOGhQ?=
 =?utf-8?B?c3Nibm10b0FJamxwRjllTTJFa21wZjVSbzVlTGJMV2JQajJ4Ym90anJhMFVu?=
 =?utf-8?B?RjVtazVFakYxalZ6S1h0WE0vaGNDRkdhOUJ0TlhkSG4vNWljRjlwQlRzRjhC?=
 =?utf-8?B?d1FTWU5JdW1wZHFjMVlGcFc0L0Y5RTVFRWx1U0dLakV4VjNWZXVqNzZ6dmNM?=
 =?utf-8?B?S3h3emp3bytzblplVmRCOWlHd3BYaUtjeEJSWThUMUFmYk9nc3BGdk1TRVdh?=
 =?utf-8?B?Wkw5Y1crMWxVRkFsZUQxSllaQWhTdk0vMHZwNEtKajAxSjN5YjBidGF1dnVD?=
 =?utf-8?B?ajhvc2IxT2dKd0dnZm11d2tCZkMwRTJ3T0RUWlBna3Fsd0lLQzVBaG5vS21D?=
 =?utf-8?Q?YSrs7TKIts0TLkv/t7AwBEUTX?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SbPArjoKrqbFfoJQZI4TxnrBrzXjzAAbAuXGY4PXBBIpQAcoO7ROU/SztauN+09qtH6/pT83WjqHKK7FqoJFyKJbwkWVbUYn9VNoTYHl/qzZJO+aA4YyJYKeEv58yTL4MzSmq/4r+357qQTIuQYI90TGot2ruJ/h38/S5EWNCenuChG3snZhew217q5xNld/TtXWFALr9cql37pHE3i/eu9pOTEpqfGw1oPz8+uqWrfPDsUxW84/Ccs5zymRXLv0x5gvCdARKYK0vUfD1JAgo7kDSLOVunlLqfF/VpabbQqe56NAS+LWUJeVYIhHfhLQ1K8oV8U3cy5k4pFxLp69aXnmEPKJrdocGOui93sM0fMktZocC0TzuYBmQr4r5nPy8Qd338SDuTWlO1G6ladw4ilh4DrgqvPreMzzXEfwK7BqInZtqJz+Te+W0dSl9cxSRadeeGpgwDC5D5qdIYjtQUGkccaGoRHFgyR16gocVg37Szb1n82Cs9FPveN1+VF0VNpaxlNulkLfCgQfmDkAaxxEIHbbN5Ah9XcHzkRTXcMqM+HNHAcWvY+KQgHP5lYC4dWImyW4W3+ms514lXnQ/8o2uncF9cU+4T1Ctujay5A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 598bf65f-231a-4174-1b4e-08ddb8d2bcdf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 19:09:00.9670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUCOhc5iucEu76NiQTUlF42t4dqeTPk8KyePX8ohrDU71NhZk3Ea39KG2/h14fAhWyNLfCKR/WcClKQ2INC5BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7599
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507010132
X-Authority-Analysis: v=2.4 cv=CMMqXQrD c=1 sm=1 tr=0 ts=68643270 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=X_ablETaOn0JW3Q_abcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: jQxcMN8n-UXyv-0GuZI4_j22uuMQcLHN
X-Proofpoint-ORIG-GUID: jQxcMN8n-UXyv-0GuZI4_j22uuMQcLHN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEzMiBTYWx0ZWRfX2iKRdcy8fEEx ReLtuAyC8n1yrs28q9pwzG/7zhrZL6A5kdV7aQZgvCgQXD4kG/Sk6JaDX8cfJYDeHP+QtKGXJnI 5+kXJywepbSY4TWIEQGtu2Ok0f7YQxt9BYvekws1c94/cPpY0TWMX4TXo6eZ0CpOA1gv20EN9Ic
 vhRzUhUrE4klyupg6dqi/Oc4awsKrhx9orQhU+Lgdw2iuygvLD+Z6ZvsfVaGvFW6Ne88GzZLFBP KQvVTiI/AmXDPz4oH389ZOONrVvYmYigp32PgPBVE+cGV1M16Syge2dkZvwN7SZTDCPh7ff2Pw1 1zA7oPE1PSSJBH4jOU85T1gSlcynimuEDDYyxzH4pdcCBfJ5ku3SZ+B4I/dg4SdhhFbvlHz/By8
 8oCxIHwfCFi2yvLWJ3UVn7i9Yc1GV9mhQWKG8xDpnpvZxYpSc4N7t78cTUDZuzibjuTP7Z2O

Incidentally, looking at the subject lines for the patch series, I see:

         dtrace: move get_member() to dt_cg.c
         dt_impl: bump number of TSLOTS to 8
         dtrace: add tcp provider
         dtrace: sync dlibs with tcp.d, ip.d and net.d changes

That is, each line is prefixed with a component name.  We do that a lot 
for "test:", but otherwise the practice seems to depend on... the patch 
author?  Anyhow, I claim "dtrace:" is not very useful.  For patch 1, all 
the prefix is saying is "there is movement in the dtrace code base."  I 
think the subject would be more direct without the prefix.  Same for 
patch 2.  For patch 3, if one wanted to use a component prefix, I'd 
think one would use "tcp:".

Historically, it looks like we've added new providers with subject lines 
like this:

     rawfbt: new provider
     Implement the io provider
     Implement the ip provider
     Implement the lockstat provider
     Implement the sched provider (first part)
     Implement the proc provider
     provider: Implement a rawtp provider
     Add a CPC provider
     PID provider implementation
     Add a profile provider
     Implement BEGIN and END probes for the dtrace provider
     Added IO provider support for 4.14 kernels

Everyone has their own style.  Shrug.  No big deal.

Anyhow, personally, I think the prefixes don't add much, especially for 
"dtrace:".  My suggestion is to drop the prefixes, but... your call.

On 6/10/25 09:58, Alan Maguire wrote:

> This series is a first draft of TCP provider support, where the
> probes are implemented via underlying fbt and sdt probes.
>
> Due to the use of the sock/inet_sock_set_state tracepoint, intended
> for ~5.15 kernels and later.  Tried replacing this with
>
> fbt::tcp_set_state:entry
>
> but this misses a few state transitions, so stuck with using
> the tracepoint.
>
> All tests under test/unittest/tcp pass unmodified on an upstream
> (6.15) kernel and 5.15 UEK7U3 kernel.
>
> It implements all documented TCP provider probes:
>
> accept-established, accept-refused, connnect-request,
> connect-established, connect-refused, receive, send,
> state-change
>
> Changes since RFC:
>
> - fixed issues with test failures on UEK7 due to missing
>    SYN_RCV state change
> - moved get_member() to dt_cg.c (patch 1)
>
> Alan Maguire (4):
>    dtrace: move get_member() to dt_cg.c
>    dt_impl: bump number of TSLOTS to 8
>    dtrace: add tcp provider
>    dtrace: sync dlibs with tcp.d, ip.d and net.d changes
>
>   dlibs/aarch64/5.14/ip.d  |   1 -
>   dlibs/aarch64/5.14/net.d |   6 +-
>   dlibs/aarch64/5.14/tcp.d |  52 ++---
>   dlibs/aarch64/5.16/ip.d  |   1 -
>   dlibs/aarch64/5.16/net.d |   6 +-
>   dlibs/aarch64/5.16/tcp.d |  52 ++---
>   dlibs/aarch64/6.1/ip.d   |   1 -
>   dlibs/aarch64/6.1/net.d  |   6 +-
>   dlibs/aarch64/6.1/tcp.d  |  52 ++---
>   dlibs/aarch64/6.10/ip.d  |   1 -
>   dlibs/aarch64/6.10/net.d |   6 +-
>   dlibs/aarch64/6.10/tcp.d |  52 ++---
>   dlibs/x86_64/5.14/ip.d   |   1 -
>   dlibs/x86_64/5.14/net.d  |   6 +-
>   dlibs/x86_64/5.14/tcp.d  |  52 ++---
>   dlibs/x86_64/5.16/ip.d   |   1 -
>   dlibs/x86_64/5.16/net.d  |   6 +-
>   dlibs/x86_64/5.16/tcp.d  |  52 ++---
>   dlibs/x86_64/6.1/ip.d    |   1 -
>   dlibs/x86_64/6.1/net.d   |   6 +-
>   dlibs/x86_64/6.1/tcp.d   |  52 ++---
>   dlibs/x86_64/6.10/ip.d   |   1 -
>   dlibs/x86_64/6.10/net.d  |   6 +-
>   dlibs/x86_64/6.10/tcp.d  |  52 ++---
>   libdtrace/Build          |   2 +
>   libdtrace/dt_cg.c        |  39 ++++
>   libdtrace/dt_cg.h        |   2 +
>   libdtrace/dt_impl.h      |   2 +-
>   libdtrace/dt_prov_ip.c   |  45 +----
>   libdtrace/dt_prov_tcp.c  | 405 +++++++++++++++++++++++++++++++++++++++
>   libdtrace/dt_provider.c  |   1 +
>   libdtrace/dt_provider.h  |   1 +
>   libdtrace/ip.d           |   1 -
>   libdtrace/net.d          |   6 +-
>   libdtrace/tcp.d          |  52 ++---
>   35 files changed, 761 insertions(+), 267 deletions(-)
>   create mode 100644 libdtrace/dt_prov_tcp.c
>
