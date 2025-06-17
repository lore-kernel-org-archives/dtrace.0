Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBE529826D
	for <dtrace@lists.linux.dev>; Tue, 17 Jun 2025 23:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750202334; cv=fail; b=XDSYOXUr0aeViseeV/XVHmM+QkXw7holpAT1tmoXVGpEKOo/6a16rGEf4Pg3k/1yeCHfMXxmx7A3u9DqFw1kdltxW7xLookRr/TsPkgzGremuz8Z60j16gHgBgil7IaI4cEZDNisTl2AyjqbZWKA7TtOG44tYZXCGAvc//vL5o4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750202334; c=relaxed/simple;
	bh=/1CMNw44odJK5PI63TgJDFhBDNTiyb2YpMXV8KVXDTY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CD+uN0PxhAu/kr5ppZy1O1tKw/ypXJlprJa35s9dtxjGllRgDP5o6Esud8g8WjpquuOlId0XvdXQ8QStBoCZVWjNMdrnr7ouPP6+5r+p2egcnqTBuKxaiKgi2b9f5xMMjn8N6IGe2FrvK2IrI+RFSg7JQsdErM91RvB9x8pIA6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sM8LaFsg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pMhUaR21; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sM8LaFsg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pMhUaR21"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HHtklJ015037
	for <dtrace@lists.linux.dev>; Tue, 17 Jun 2025 23:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=wv1b07kDjY3a90rxJZIsMgfXZYRuphrETeZr5IDPolQ=; b=
	sM8LaFsg3yobGZjFRrIs3UT6KfXuiBlFTztNEBhiuqiF07ZTgRAZuNhSaoXHmx+L
	Ol06hBwCvFmJsjx8HIFCaD2r4up9dumysnK2mh0a281hEd+SOB0Qp/KcCo6o0ZlP
	EZF1pr+vD/1KOpfPI7IWKUvLvo6jDKPxrZLME4CeXz/t+zdvBIK+BJJlxbPI+8Vy
	lraAodmsCoS//9vE4MKrT/x15/HgN979qYRHkl4BWbOT/4uTOBOyXlIOWDfq2R1W
	bp9hSIW64LPxc54VxUrGHNX+xA7tiMXVUbv64f3KNR0BiWb0RtOLWteGO6RhlLD/
	kq16DdTUx8VBOnZdeWqVCw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479hvn60h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 17 Jun 2025 23:18:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55HMHP9S036254
	for <dtrace@lists.linux.dev>; Tue, 17 Jun 2025 23:18:49 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhgdyx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 17 Jun 2025 23:18:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CE/K81IvxtwgTRuxiC1swL6Ev41pAb9QZLuH59l99R+ArznIz624uasNXpRp49VCnjZonq2H1PXEP+piH+FctPE4+VI5ogAN5s/fkx7E2ZnWUx/be9FPU86OKPxQwnOeBNZ30pJkBtBGKyI7tPq8FTkOPP7459KtBKNDX/mNUlGlT/SLvQFIxIpiGHgNYdUHiS2Gi2JvNtlXKMPToVLVyXuaAMVjYQYMRPHguHtIM+Z3yLc8EFKKKMXwvS2F+Ykx3njn7b5I3aEM2YtI0KbOO/ocJxuIXXkIpzpc4i5BKU29GIbXCBHpkivFV2p/0hr2CHTw2go8ldKSMJ/2RbD2WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wv1b07kDjY3a90rxJZIsMgfXZYRuphrETeZr5IDPolQ=;
 b=J/3H+peOewbZ4rgCTpH9nkNbBuTPpZAkPyw9j1nV4bG/o5SYq/0w11QL6U9LDK3L61lodAPlmssNKjVGVdcm6P+E+ZE56C4FPVeTY+Mh869xCcJROJRpJKsJzWoDG7+JYsMz37+FIQVGFEr/LA+OsSzCiOCNMOlsCq/rDCchGVhca1CvhfFKNgtxfvzTD0AXCTs60VOB0z6FoLIpPzzskpnQG/e8UaEl2j/4pORTLiVOXNd54JNMH0xRzPlc0QshIDLOTH+zp3dmgxC5bo59VgYLjlI9GuAfQ0ejoG9d6TrGH+TJODgYN5x60pXXOXmyS5g1MIxkvFbObMsHl8ki6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wv1b07kDjY3a90rxJZIsMgfXZYRuphrETeZr5IDPolQ=;
 b=pMhUaR21tIaS5kWjFkOWWjcF87YzTSChszltCANQCuHc50RWCC3NcUybxdMxuDtCDPaxw3fKmS2/h1aR1UXZYSKcrXjseN+1ma4zLvee+QucvGBwnYfZK5e2ihv+iiJ4G358Y4qk13un2crmCQnOCtiWroC+luARjtZgP9LbT3g=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6125.namprd10.prod.outlook.com (2603:10b6:8:c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 23:17:47 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8792.033; Tue, 17 Jun 2025
 23:17:46 +0000
Message-ID: <c9376364-9ebc-def6-b7b3-045db8db6d2e@oracle.com>
Date: Tue, 17 Jun 2025 19:17:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 12/14] Test: caller and stackdepth tests
 for rawfbt provider
Content-Language: en-US
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev
References: <20250522180118.27343-1-eugene.loh@oracle.com>
 <20250522180118.27343-12-eugene.loh@oracle.com>
 <87ecvnbsk8.fsf@esperi.org.uk>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <87ecvnbsk8.fsf@esperi.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::37) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: 668a5ada-6312-4450-9e19-08ddadf528ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TnA1dUFEb3I5ZFZFYlJGUU9hc3JjOFBndG5FUHhrckk5QU5DZWMvUVZFNzVp?=
 =?utf-8?B?QjFaT1pFaTVZZHI2ZmVCcm9Ea3loNC9hdzdJc09mNTdMM2p1aE1NQmtRc2hm?=
 =?utf-8?B?TUZEeUJLMFhYRVg5YjJmNHZwK3F6UG9uNjRDZHFzZE5pTGw5K1Fua2RUdVZW?=
 =?utf-8?B?Yyt3Q0VRb2x3NEk1M0dLaHl1cCtIdmtFMEVSVUs2endiaW45djd3NFlqOTZh?=
 =?utf-8?B?OUFsTHVsc1VQYWU1TEVpSkV4a3c4NWZYSUViWlhRWHFJdCtYZkE5M1JrNFJz?=
 =?utf-8?B?MXpCV1NsZ3JTdjdmaGpnMThSOUNRekdXQ1U1WWFBMEFINlhjaWtScSsxS1kr?=
 =?utf-8?B?UXZYVGdLdU9uOGgrZmlLVC9HeGxtMzIwN216U294Q3FHakxpU1YyQk9OOUZM?=
 =?utf-8?B?YkZidHpYVFVQaURjTlo5WUt4YlluOFRKM0xPd3dvc3JjY1FCL1pRVk9ITUha?=
 =?utf-8?B?cUNsdUtRWXVPUGtNZzdJdnErNmo4ZERlNnd2NjBOeWFCNDREc1FnYm5WNkxh?=
 =?utf-8?B?bUMvZVJ0NHlKTi9IY3hTRmpRUGcxblo0Z05aNmVSc1lWMlFFTUJJTm9GSUJO?=
 =?utf-8?B?TW9PaWx2Q1EyOG9IWUYreko4aUFqekQwL3Jiby9kSkJQQlZJL0xLak1nUlhO?=
 =?utf-8?B?UnFPM1IwdWlGVE9hMk11L0tsQ0x1TE1OL2p6WEU0UGpTREIzSXYzeTJHc1NJ?=
 =?utf-8?B?dlFCTzVJVmsxTVdhQVRnMDNSNHh6VkNyQkJwUmJKZE4xQi9qR1BkRjZHUVBO?=
 =?utf-8?B?MllQZjVmaUR6OXoxdHRlc3lvVzZPYXVuemhGWUo0NUp6dXVrdXE2bDQ3bGh4?=
 =?utf-8?B?UERkQTZpcEJ1QS9WYWNDdE5SQ05wS2RieVI1YTM0UU5uNGtkSzlxTlFpZzVR?=
 =?utf-8?B?YmJRVzVhR1V2MGQwYzhyWmEwQ2p6aVgvSVUySFBxaVFYQVRoQTZLTDNMRGhz?=
 =?utf-8?B?TWVseWZmZGgySXhsNHgwT3YzNWh5enNKUVZBNFFJbFB0L001bXNmS1BraGpi?=
 =?utf-8?B?OFdDL0FkYkNrNncwQ0RNUG5pWGRoUnVsYjlBY3J5TDNlUUdoMm5VYy9WeXFi?=
 =?utf-8?B?a3UzL0tMVktCWDluMlFBbnNQQW9XbTFFSVZjWTd5d0xlRlFMeVJDT3Fqb3Bj?=
 =?utf-8?B?S1FCRXlUS2RXU25ONFhMWHdoa2lxdERhQ3BES1NjR1VwVGVqWUt0RktlS2JN?=
 =?utf-8?B?dkdibG5NMGdxckZhQWdlZGlCdDVOL01nYzNUNkNWdnpKMk5RZEhuOGJTT0VC?=
 =?utf-8?B?S3RWYllYMkhoMkxJYkRtcnhOY29kTklmc3NMNTdUb0ZOTjcvVW5QOHVQZzBY?=
 =?utf-8?B?Ny9LV2tlbkxYL2sxUUZUSXVVM05uVkw2VmJvRlJuZDlZQ1VOM0cxOHJZZG95?=
 =?utf-8?B?RzJaYlAydy9LVEVDY2lIZU9rUzg0UUxYdWppcmxXaDE3dDM5WjhFVEp0bFB5?=
 =?utf-8?B?eDZpRFNXUlJOZklkdzB1TXc0WjZMbWYydVFZOC83aTJmUGRRcW10bDdFOGp1?=
 =?utf-8?B?bjdBVVZTY1V2emZEZkNZSTNJaW5ic0xvNWZRR0F3QWl4dGllWkQ4RkJwVW9Q?=
 =?utf-8?B?a1dLc25ZRFRWSEFpWGJlTkVIVTVVaStoQVR3OGh3WnllWTNYajRFc2JnKzda?=
 =?utf-8?B?QlFzZ1ZVQXdOTnpIbU8zQ094K1YrM0ppdENrakJzZ3N1ZWM0Tjd2c1R1UEpZ?=
 =?utf-8?B?b3VSVjJKSjBpbWpIRVpWaE5ON0JKeEZnbDNyQ1pRT2EwNmluU0EzOTVNdmxm?=
 =?utf-8?B?NWErMkJIb0Yxc2NiVGhLeHFTdjRGaDl3TnhMQ2JLa0dDUUdIL1M4dWRsM09s?=
 =?utf-8?B?dGszVWpTd1B5N0c2S214UkRvekE1aUJ5aUV0bDZHaEZoZVMyTGw1bW1nUlVK?=
 =?utf-8?B?bFpreDRmMW9KWHVDbUdLeFkxSmtsY2pCTEwwMDJCMWVBamZwNDBVZHA5QitR?=
 =?utf-8?Q?w42Uu4oq6ug=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXVQU0c4cm52TUJWSDF2aHFhWnJmenNrOU1TOXdnZVRVTGJVem5zNCtXVlUr?=
 =?utf-8?B?TXM0QTFIVlh2UTh4L2xQVTN5ZGErZ3BQVmlDTWNQS2dYZVU2YXJaTEIxTEov?=
 =?utf-8?B?ZTd2VEVsOXNUMEtkb0FabUQ4cHZBZkd6aW9FSVd1eFJwTDlMY09ZNDJXaytU?=
 =?utf-8?B?TDFIMi85Q2xKWHdJQXBVU0FEYVhXdW44dlFWSEtHK1QwaHBaL2pCWDk0eVM1?=
 =?utf-8?B?bmdlWE44QXlOWjB4ZkVuWWpUUGYwWmZjbW5FNmVQcW51Sys3dkZDdElkNUZT?=
 =?utf-8?B?bmZkQVBEZ2dJS3hoTVQzcndTejlYK0RISnZBY2s0bkZZZVBYNWp6OWd5QW5v?=
 =?utf-8?B?R1drTlZBMUNjeXYwdDEzVkxuaHgrNjNqQk50S1ZxUXhQRU9JSENwR200bVlt?=
 =?utf-8?B?TXhUVW5EditMV0pzREdneUZiS09RVktIYUVDRElpUzBXMU5lbnBxTkJYTjgr?=
 =?utf-8?B?TUpqREZZbXJOcVhpK1lnWEhWUWdRSk8rK0lzV1J2S1hSM3Q0eUNuTk9KSlBY?=
 =?utf-8?B?cHJuK1QwZk42eUtVUG1DTUErY3RnVWRTTkJhNGVSaVNLK2w5azFNZDE0UGI1?=
 =?utf-8?B?T0lxVTJBelVzNUsrRW54WEZnUFRDZjIvMmFkYUNvQVpqcUNzRXBJZTVTSFBC?=
 =?utf-8?B?dHJwRFVyVnZtVFR6dHJrVE1XZWdabTZydGI5QytpYS95VWZFR1d0azhwblVz?=
 =?utf-8?B?TElJekRYWE9DUzVZSFBWcGlPa2ZLNjZvajV1WWFZdXV5SDcwQUxGc2dyMjZ5?=
 =?utf-8?B?Vng1a1FwN3cxeUxTRjQ1cXJySzhZUXJBTUZzdmY4em9yQkx6dldLaGJ2eng0?=
 =?utf-8?B?TklUanN1N2FTK0lVby9HemlnNEJFLzZ5dUJ4UzlrdlZ2eURNazIyRWVNejBI?=
 =?utf-8?B?Si9KeXozK01jdVh6UjdRVHRxVUptSWEwS3dYMHEyQm1GdllGVTl2aXpWRklX?=
 =?utf-8?B?T3pJZitwcjNMRHM2S21LUnJwU2YvT0MvVVMyQ0t2eENTNUtNcERWMXVaV0tI?=
 =?utf-8?B?ZTZhMVdyTjRwSkdvWnk0NEx0NS9iTHMwZE54eDRLNTZIUjBiL0c4eTJ6TWJt?=
 =?utf-8?B?S2RtcTUvUU1RWVUzWldhcTJUd3dlYkRySzN0WVVhMXpRMVZ2NHNGelFVS253?=
 =?utf-8?B?Ky9WU05hQmU0TXdUSVdFbjFCblJ2blZ3TzFRcmcyeEVyeTRuY0FlQWM0YkhF?=
 =?utf-8?B?ME9Tek1Ia01rRmx4enlURThHQkJCdW04M3RWeVJxSHJ3UVEwMFZ4TFpsUzdC?=
 =?utf-8?B?LzlVdHg3d0hLUFJXV1pCTFZMRi9PUlFMdDA5YnByQ3JUL25aL3V6ZkNyekx1?=
 =?utf-8?B?Qmc3Y0d6WW1GUU5HVmNEZHYzb24xbVBLMndBMlBhRDhVeGFqRjcxNnRvS2E5?=
 =?utf-8?B?cDZSRTdqMCsrZ2Y3UkFpL1VrNmUvL0xSR2tMTmhMWnA1VFBQTGVqRWhadFFO?=
 =?utf-8?B?Tng5VHk5RXQ1VzM2TGphRXNOeHZLM0lweWRNellDeHN6M21zdTRORExUaVRO?=
 =?utf-8?B?bHJ3SW5zTko2N0FBZ3h5WTRsVEdxemNTVnFnTG04cmhtd1hrMXRxWGJnVzBV?=
 =?utf-8?B?OE43OFJkc0V5QjZvZzcySHJteG1KNUNObzVTQTIxVXIzWHZMZDVvd0xHdGth?=
 =?utf-8?B?eTFKaXlNZEJqdjVDRUZpeEphNkhzUnl4T0lCKzBmR1JlQXRUNW8wb0M5eHUw?=
 =?utf-8?B?YkV4NGpsdnlvL3dZcXlPS2tkWnQ5Z0FVcnQ1RW1Za2w5UlVTdXRMVE1qbXRH?=
 =?utf-8?B?V3FVb21WOEFOSW5hbE5MTklNNEp0YnVmS2VhNmd5and6dWV6SEJDeE1ZZnZY?=
 =?utf-8?B?VTZRRDBRSVJZUThSU2hGUDFkejBoM2d4K3l0VkZPQzdGOVp3Qjd4VVROU1Ry?=
 =?utf-8?B?SndvQVRpMEdPbWNjRk5Zc1dqSEg3Z0xtQ3o0MjFlV292cloxNDNEaWxYcG82?=
 =?utf-8?B?cEQ2LytRc3h1T3Q5MlMzd0duK0REWXg1L0V4bDZVaXpJdE5zVmp3YUlPYkV4?=
 =?utf-8?B?cE1IYTRuUEh4U1VXZ3hKZ01CQzQvZFQ4VTlPNGFwZjZXUTBIY3c1djZqUC85?=
 =?utf-8?B?MzllVzVQeVUrMHdVZDBJQ0JJczVHdjFBdFUxNkczL2QwUHJBSVdtK0hJUXNm?=
 =?utf-8?Q?thxIomnWAmrQ102ByULcO+rtZ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KT7Psp7zPvejHAcm3yOBVnjHib0RNpLj1vanb/Ykd4eWlLDndiprAqEhcp5txgrlkd8AYfNNFQztvETflWcMxKtOts9+v1FucOe4y/Q+fSaLtXfynUs0Llp+aM0FOLt//bWB4nXC95p7bbEon5vJ9ZnaKguiu0NZsX886ijKOsZXejfUrXjgBz8TDNewqOezVxf7R82JyXD4JvcnewXrNi/OwpDVfmAgWPb6+Miu3H465FMTx1xMhOxfrVkuU/VMXJro69v6WXACD+k14FyaoEAeXoCrvKcKb/AA6rCW+/uZ0QlqsGfEmxSkSGzpPr9OkvRiVWnHC2XUqKbfMvEqQYxGpAhHff89V+KgG8skULjPVHRQPVGSf08yPGhHYyOMZbPPHHvrQFfXO5J+uFs4RvvG0yr8QNRabiIdrKCFrwUeA1u7RurTO5/9NtPJadKog0WYlQm7lIzZLYF2YUpIDKM4X7hBGzoOj1ykax+M5w38VpS7ifseEnIyRAIsS5H8sS+0Ir4IhCwAq++8l8ly0WNXQZicgnOGNgIeOuhHEcvEgbDon6EbG+Z8pSbpSqCS4o9xZHQ0/ZRtv9/M2uwobzBxKqYhH/FIoVfcXMxsmo0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 668a5ada-6312-4450-9e19-08ddadf528ad
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 23:17:45.4078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C17sAYXrRB2VpCp18SYKgEZB8xlSCnaPXCr1ZqA+qXysyBzw89wYK00/fsA4mmeBuYEuOh3TFvED6dZgb9CGJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6125
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506170190
X-Authority-Analysis: v=2.4 cv=XeSJzJ55 c=1 sm=1 tr=0 ts=6851f7da b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=fgoKrthh0tXPJl1hmfoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14714
X-Proofpoint-ORIG-GUID: 3zhJjJOgt9X7L_4fFOi36mvThIXTyiAW
X-Proofpoint-GUID: 3zhJjJOgt9X7L_4fFOi36mvThIXTyiAW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE5MCBTYWx0ZWRfX67A0OZe7zEul Vui5kcP8qVDijex9AeIJmGQqHAnm4rKbN9FCi2rOIUzRFmg2ytEzMYkXkUx3lwO06fTIocX7JeE V86obv0RZ+Xz2oLMW3eWDjZi7hQ7DsI1ztmJ//jjFCFcEPlwoZT0w/s8KqkjG6Ota7V/gwuLOf1
 JBu1lpso7iifoCt4L4dnl5+SflcPFdPWM4DKbUqOa021IL3Mz6p2xn11LIfgbS4q06ykS61nOXW +6hQvS8c42o8kFFKgfrCbbYqRRECvXhjjZTOHR8RYFQtfJlNT26OttHoRWTgSBX0fjaAX33OwtY OCEY6LQ10pdqscwMjX0Qg4CUwuT9gjPgKg4O/H2RInTzmw4ktznfSZSxNq9ctRFdzpwo0org/J2
 etQ11+vFf5dCXMMXGjBFC5YhhUxA7eltu9klEcM9P/ejz6tnergHU01mH9jMmoZ7tKHOSshD

On 6/13/25 10:54, Nick Alcock wrote:

> On 22 May 2025, eugene loh spake thusly:
>
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> I note the lack of any sort of skipping on older kernels. Do the
> concerns about older kernels not apply here?

You mean with skipping frames and the BPF helper function?  Right. Only 
two providers worry about that.  One is fentry, but we do not use it on 
those older kernels (fbt uses kprobes instead).  The other is rawtp.

Did I say "only two"?  Well some providers (like sched and proc) use 
rawtp to implement certain probes.  So, they kind of worry about this 
problem.

But this provider (rawfbt) seems to be fine.

> If not, and this was intentional...
>
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

Thanks.
