Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB0D26A0AF
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761103415; cv=fail; b=BClf/xnH3snnlgM1daO+0f/iNyUUhrZvDjMMgkrOqnfURcnqXEXI4RoftZE5HD6dySt7XSz+7S9oovMuPBPXgmydfu/FNEuxssiNxGoDTmJ9jnYZ+Th0M3j3Ge9rp4cv+/xdEHJ6IMAc8r/RnTa6UEbpBg/vb0lhNBzJs3dXods=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761103415; c=relaxed/simple;
	bh=JAFHJib2Zqer/yKSEQXBIsn2xhD34WBA5hILg3F8960=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TYjqqJnhyoKidkVS7ziHw1Hftr+9nGBbzwEZphpY9HtEB+R7Ql3hY7XBMI7aOOFB737Qq6su+iOzTCXOhQ+SMk5vpmuWl79FrUz33rdVDQ9Vp19dODwGIhbsgUIOp0FW/8p6xXp31xGNof44wdkVvzH5xQC2auv+P4wiBLVxKVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=egxFgo3n; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LstBmQbD; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="egxFgo3n";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LstBmQbD"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3NTWc002109
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=i33h7cQhvtyPH0Dp2lLtxKYloWHqyKGf3omzEqCiTWc=; b=
	egxFgo3naqBQGbP92ybhQiRKuJB2ao6iBxtMZhZBodoEXhPeC0VtHh1etp483Nav
	bNkLhzk+SGgBbng4h208Zbi/waWMjqfjk4LQVOcDn/eWRJggN3jk63+c1+sZYVO+
	zhF9QHtgFFS8+TTPAMlPTdkk8omsFWMHnw84X3X13F4jbNHiX81Tt/cZY+D5BXpB
	bl5vWqytinr0N2VTuec6R6GTLFlQD/BCYkYBDr2CW/WJHGaBrKhpMmdiAEkPPIMv
	ZNlel5cigZ03Yok/6P2BIxn4xbrLDU9SwnSvFcTgUOGg+y4EnATshITM+vK9xW2D
	yjhlvgINqRni3r7LOda8eQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49v3076ty1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59M2d3Xe032305
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:31 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010035.outbound.protection.outlook.com [52.101.201.35])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bdn3h0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U89g1J8xOzMfLHo/MUBRUFEASdvHNjh8KEHohgWBazZK5goSb+KuSKXGRXvPGuLG+sfkuOI3QPHQtF3eX4qO1piKg3geXbvk0nM7CfnKPL0Q3VGHdZpVTX/RFMxVgYaTzWeAhlquzk51oIA0QJLxTMvxNADKulAZh01cTFJuj/OBVAcaPpBhYovrJpci9cEkW76YnBqjPjD8Nu8Pr/9+251piuxTdHo79Mxqrg6lGja+kqyta59u1PxFCQ0t3C5n8uxJwbsoSZVEZ66iRiL8ZNKY3c9CL05UryvT9ivsY7qy3OAg3ZCIThYgZWWQXKX0Z6eOmnnHMQQjZqGU3C3xlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i33h7cQhvtyPH0Dp2lLtxKYloWHqyKGf3omzEqCiTWc=;
 b=yEnz5v4cNATVjLJe/dQxMeBBGXOmfpqXAs9TPpLZZ3Wlbebp0TpqZ5aazQBnu1FCYwxJYcjUHdY02IU2dUJ74MSAFKBEPIA30TDZWgdSXJm69mLCXhKfsRshn3tt7SMaSj7/v792z8Xd6b5gp6Oy5lrrvvAWzdjH5Ugqf9iNj2/ANklCOX3jNcC4yHovGGBMg0tZ8guejSDcLvtM8RGBt03SAe1AGawwKgt2M0wLS0ZIyuacH3gLXUkeHAJLef92Qaw8Too6Cef9OUWvCiR6JQveQCM7niPD7l08HzrcGlNAG62eR8195EDHGTnm9fabssqPh7ifZb5kZ/1OLTWPoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i33h7cQhvtyPH0Dp2lLtxKYloWHqyKGf3omzEqCiTWc=;
 b=LstBmQbDwKHp4RqLVc8pYqUEvkv6UrqrZhnizJTNtdQOTJpUkvmf+E0fUNetLWymTD0vAq2LGQ8zKT8CEeX3OCvLRe0ZWrQMKtx79rTexm+7M2LZw6vubiqStBQ9Q91hJIcLZ/HsjaNehlPrIChXHMRAv86cQgYxIa80f8de3eM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Wed, 22 Oct
 2025 03:22:58 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 03:22:58 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 08/20] doc: Fix anchor links for built-in variables
Date: Tue, 21 Oct 2025 23:22:38 -0400
Message-Id: <20251022032251.2010-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20251022032251.2010-1-eugene.loh@oracle.com>
References: <20251022032251.2010-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR02CA0053.namprd02.prod.outlook.com
 (2603:10b6:510:2da::24) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: f747b0a3-83a9-4abf-2f1d-08de111a4c2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dFl6aDAyTWtZeVJ0bTJudE12N0tSSm1aRWpnc3ZwY0hOL1Y0c2xTeW1oRk5C?=
 =?utf-8?B?Z0NzaDVoclpmQzR5VkNXMEtCYThFNnVOYXhkM3NCbVdhL2JmOEd3bFh6K1Vj?=
 =?utf-8?B?Y0g2SmticDhMVlFQMXExcmthOUkyT1BBVlF1NkRsOEloOXU3MThvZ0FDS2NE?=
 =?utf-8?B?bUhqaVIzaHJ5OHdHSm5Rb2NFNE1naERldTlYME42YVJkTnlKUmZaUkYzV2hN?=
 =?utf-8?B?a2Y2aG9BNncyNmlUTUNISHlnYkNoNFowc05zLzlrUzc2NFdwOXNaSzNieVgy?=
 =?utf-8?B?SFhCOFBJWkNGUkxVVFhHcUpDMnI3WEZ6dDV0MDdHbjRZUmJLSHVrVWdyZzZE?=
 =?utf-8?B?cVMzVHRLNmFGd3BMMXdnOHlGYWUzNTdBQkxCdHd1aS95eCszMlg2S2lJUkRD?=
 =?utf-8?B?b1l6RXpneE1EZVVZbTdWd0poVjRrU1dVSkxzenNOdlF3N25aeXVmUk12QVkr?=
 =?utf-8?B?K2Myc3JWcDBjc2k5eDRxZ3RqTVBnelZpOXFmeWYwblFPWUFkYTlGUGRvL1hC?=
 =?utf-8?B?SFhYTUM1aG5tRGZTYlJKaFIzKzI1UVMrd2NhdVE2QzNFUEJVUGdYWUVLMTVq?=
 =?utf-8?B?NWo5Nk1rZEFXVzZDRXA4TUp5UGFFWDVRMmpZSXNKM2h0dGdTeDlwZlJNRnFI?=
 =?utf-8?B?L0o4MCtra0VoNi9DQVFuUTBEclhqRDJMclpyZ2hKS2R6cGttZ1A4V29WRlFP?=
 =?utf-8?B?VktSK0tDNC9ZeWJZZ3RSNCtYc0xnUkljbytyOTcwWXM5eGFXQkxVUkpTZEhW?=
 =?utf-8?B?MnZxR0NGNStlbGlnT3NJRFc3bmtWU25lc2k2eis3b2REWWIzQm1SbjViVkRn?=
 =?utf-8?B?WnQwRVpHRTFLa2NaeWRtT1NEd1NuaG4yRlM2Q0lKa2ZkZDk3L0IvaWlWekEy?=
 =?utf-8?B?OW9xN0IrbUdTaXU0R0xUQ1ZNVUFvb3MrdUdXUlcybjd5TGxMelVwQ0lKWXZz?=
 =?utf-8?B?WWExQlJiWGExS0kwRWM4SnZJOGJpREcwaFdYcGJReE02dk01TjB5QzZvaWdi?=
 =?utf-8?B?UlNsd1o3UEtuM0RZTFhuMlYxYis4VVNMdTNyMjlXZkpUWEpPOVVhRU05L0hT?=
 =?utf-8?B?M3hURzZ6ZUVGSElTYW9lN1VNVmhQUHpVbU9qMWlFTVhWWU4wTWdWbFcwOWkr?=
 =?utf-8?B?UGJPV1B5NlVMSXlnZEtwM09Hck5RMlJxb285ZmJHS0FzT3lXZ3ZUNi9vYUdZ?=
 =?utf-8?B?NmJLQnpxWTdDWlVuK2ZQbzhtMGlMWGcya1JobEtFMnNUV29EeUpLMVBWYXd1?=
 =?utf-8?B?YXNFVlVoakFLaGNDN3Y1dzh3bUJHQmVDWjlsNk1uZlYxbXRiaS9HS2QvUk45?=
 =?utf-8?B?UGRYNTAzcDEvVUkzYm9aS0xjSlA4c2VoOU96RG8xUFNyWkozSk1zM2FQalRW?=
 =?utf-8?B?WU4yakxtOU1qV0hRYlJDRHNSdXkxajRUZmlaZU9PYVhNeGZSRzU0L1dyUGZJ?=
 =?utf-8?B?Q1ROQWV4aUxQVjgzakt6U1BXTU8zQTArSFRDTURiMzFKYVlkWVB2UW1mS3Fu?=
 =?utf-8?B?M2t1VlFaa1J2MzljMEJ5dTN5NTl0OUpUbmtLKzlCa0tRZ0JIQXJ2RTgrWFUx?=
 =?utf-8?B?UTgzVllDUjBXcHE1ZmNnVFhkMjdWTDVNOUZKWkV0bUprQ05Yd01PelAwYnhn?=
 =?utf-8?B?dnJuVm4yWW5PeVZjeEhOalRYS05mK1MxcW5UZTFlQnEzMlVqdWUvWlNOM2o0?=
 =?utf-8?B?RHZMdDJyR1Era2hETXZaWUZOTFl4V2JGN3pPR1Z0WHhzRzhpSnZYenV6LzdS?=
 =?utf-8?B?ZmlwNWJNYkN2Q2k3TGdIbnVuWUUvY3QvYjdHRjJUWkNBMHRyM0o1eUduQ3dt?=
 =?utf-8?B?QWZJUmtzTUhHWlo5ZEpYV3dzVjRWTTFreDZQWDhZT3c4REkxK0lWQXhNcDlW?=
 =?utf-8?B?dGdkSGdtdDZQdHFQUXAxa3hndjQyNkJKRHNZdHlSY2g1bW1WWXRUQkk1YzAy?=
 =?utf-8?Q?nVHZjrCT7Kv/wsxPVnsQYJOjDNlKAJFq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEJDSXpJcXZ3dnMreDZaL1NoRlQza3VkSjJNWWM1VDk0MEFnY3ZDRXdDY3Ju?=
 =?utf-8?B?anh0Q3lrMXV3S0JzRlk1L09YTmRZMTU0ZWZTTUQxa2x3MlIvR1RGOExoRldn?=
 =?utf-8?B?U1grdkJJZlViL0hRQzlTRUdiekZCZHlkRmc4RmRoU09maUFmcW9jNFJ6Mjhj?=
 =?utf-8?B?SXJiTmthU3lHcGNZbzdvSmFTckRPNDNqRlV2U3grUjV6VmZxcGJlZ3NLem8x?=
 =?utf-8?B?ZXVXWjB1L0hoS0lsM3hFbGxVcmNBREdEZGE5WnY4ZzgxYkpmZjFFRWJpRjJY?=
 =?utf-8?B?T3NqcUNIbEtHSG4yQ0sxdzZFRm4zaGNyaHB4OUxSaG91bTZSRis4TjZLYlQ5?=
 =?utf-8?B?aWkzZDVmaTlDbE9aWkRqb3FTVk1lQ0ZoTWI1NFlMaDQybGFWNTNEVndGZDJH?=
 =?utf-8?B?L0sxUGVGTDlCTU1EU09EMVVoV0VUMEoxRm0zRXdtZFZjcEFTOXBJdzkzdi9i?=
 =?utf-8?B?dFVVV2YybVR2eDhBbXZBb1ZGM0ZhQW5McHY1VHdhQ2lzOTZFSk5nS1cwYUdj?=
 =?utf-8?B?TTkySmtabTN0eWpYMVBJNlZSVXByMCtNUFFrSmErK2tLQkw0MnZ0d28xRU9R?=
 =?utf-8?B?WktBSS9oWlJVU2s3WGNrbG90UzZRYTZBWVV5UkRIbHJLeFZhazJYaUczU0J6?=
 =?utf-8?B?SkkwdHg2cHlXaytFYXRKYzdOTHlpTCtZTng0eXNNMXNGVkQrT3RxeFNzVks3?=
 =?utf-8?B?Y1cyUmV0R0ZlNEZPbSt3WW0xWDZ4R2x3N2todnJoYnBPUCtCMHdRdVh4OUNq?=
 =?utf-8?B?VzlvNzBKd0p0cVp6TnhidzFkcThxcDdwdkxVVDdoaDJMQjljaWFqZTkwS0kw?=
 =?utf-8?B?M25uT3JDNEIvVE5WeUhlQ2wxM0VKMjVnY0xrdGpyRG1KMWRyckJZYWhVeG4w?=
 =?utf-8?B?azNyRE8walBUNkVzMWY4YkgweVp0N2pkN3JFQWNMaExuM2NCMXVrR2ZlcWQy?=
 =?utf-8?B?Uk1ZUWdEYzJ5clNjOWdyYUo5UEdZQXBEL1lMVmh1a05zK0RzcndmZHlwenVw?=
 =?utf-8?B?YWNLZ09QQk90b1ZyYlhDZ2hReHFZMzl0Uzdya2dlUzNxU3Z0b085RXNvRzJi?=
 =?utf-8?B?UUhsWlhlWnlrTlMzK0t3RXRKVE9qU2FmWEZ4alFwZ0Y5eXBzS3NOUVJ4aGtB?=
 =?utf-8?B?TVQzU3U2ZENWdHl6azBncWpFYnlDRFlXUnk1MGtzVmhhR0xHQ0dlbG5Yem5E?=
 =?utf-8?B?VkoyUWpDazh5S00vUFFYR2ZrR2hLZDdadFlKdU9LVTRwUTNlaGdwVXZNQjVx?=
 =?utf-8?B?QU0yV09LcGl4a2hNbkI1RmdZU05Db0ZGZHgzeG1nNHNtd2JPSUdXSm9Uejlt?=
 =?utf-8?B?TlV2bzhjYmRTQjBsU3dFTmxVei9Yb1pCRzN5L0dCc3JuR211NUsrUHhtQ2h3?=
 =?utf-8?B?ZkxMUlRpSmN1S2h0TGNJZ1BJQTA2ZkllTTFDTW9pZktIdjNaL3NUak9CdUZu?=
 =?utf-8?B?Y2RkS2dRSE1tdTVtbWViZzJUcHNaWUtqL3N1V3M1Q05tZTFGdEF3ZkU4b1dM?=
 =?utf-8?B?dnNBeVdQVFE3ZUxKQVdhSDdmalhSWkMwR1NMcFJIYlE4cHZMeklYK2NmbXhu?=
 =?utf-8?B?bjQvQ0RBdzZwc0FWdUp0YksrWk1PTVVNNlBrTFRCdlNQQ08yb2lNQTc5L1VS?=
 =?utf-8?B?eVFoOTFNQTBIeWpEeFIwaEhtTm83ZGFEaFRGcmZmQSt6dFNHMzhoVWcrVmVk?=
 =?utf-8?B?b2c0am9qZWhKYmo1dFhnSGJWbERQenJtdXpZT29CN25TVnRCcHJyeWxtSFZL?=
 =?utf-8?B?UGtBaVhiVjFBYW9QZUo3UEg3S0cwRnoyS0E5MzNkcEpmTXlGaTg3am9BTUpJ?=
 =?utf-8?B?N3hrcldSelpobjc4QW92ZzdmMjlTaUdDWVBGOTV3OVpRdDVTaTI5WHdYdjFo?=
 =?utf-8?B?ZnVjazhkemgwZFVzS2IvZzhYZ1B0aUwzNzJ3NmQ3M1pmOHZmblZhYk4wQUJJ?=
 =?utf-8?B?b2hUMk5OQlQ2di9oU0p4bmx3THZnYk94SUZPY2tVb0E5V2ZZYmdtb3h4OFBO?=
 =?utf-8?B?Sm44TU5PZGNmZUtqcHNyS285Q0dsUU41N3J1NWJ2YmE2RjI3Vmh2Q1hxOUdh?=
 =?utf-8?B?bWd1ZjV3MnV1U25yaEJ3WEhBVWRBaGJvNU5udnQzK2Vtc0xrN2QyOVF3amZY?=
 =?utf-8?Q?sj2CmHKp1pVeDErc1Z07cXDuI?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	b3qZGBKjvGgyT25vGEvbVAqqD9Wl/NPFVdtCvZv8nBG3pTCqwg2VXBe3cY3cUi9qbPGve5or1BpzE8oRJwFTMEJBgtLDa6ywLMah42n/rkCyxvbppoOqbMuKVoGenH3m2+MWYEfXBSxkYUdZISv8OYIA45XAn+pdHGXruJ2f7zXbgSs5c5JaRP9FO7ciIMP3XLouSCvsJvPHzvz67sX9oHNoH4q5hOaiaPvjWZxCJtfQWTFBFxiVwczrhrZUwgthbQahXoBATnI6aRlcEPbFOosXniViWGqdmuO0l0izGr3tTgpqcNzX+p6d3QFkYrkTX4C1MLzCtKoRqzshlmVFFjSeZO6HMFBZBF3cdVPAVusYhNjjGrpomiFblWzBg/p4/JC6czTZXtaJiazOvx8d+8OB4W/EjuBbh51eihAwCLHF8W1LzCpTGLX4vSzyzQcppKdd+CWctEM34rb0jYvAxDYwhvdMhn8Y5MpqEP5kKNcwZDdGQMXLTuv9RluBkEQqDJzOK713vPJ46UR5yhARpedTExGg0Yg+3KjYDCMVbrixflKlw8cJ0+4iyOfVrCOmmH9vNjWQnI3IcAuR0Q+oW0G0/JLKgXL1ElnedHopMBc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f747b0a3-83a9-4abf-2f1d-08de111a4c2a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 03:22:57.9246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5qiJ+jRWDffTp45vXA4wYaBSXn+c2vP8ghti8s9IX51WmyLAsdv/kwpjP1NMWBif0vcJpTnvDB1AEzE92hjuOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6974
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510220025
X-Proofpoint-ORIG-GUID: MHxIjA3On6a37zEK2w9XyKeLrV0Zh-K6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfXwwVJqLdJK86N
 fh64ByGPSFoft/2kVU0W+aLco5nJiUjKWNQdpSV9m97Vlb130EmTdNidsVqSJV3XcALQj7RYfif
 ReXYIfQQQ6M63uUIPNPbkw/YhboKUuQNFi3y4/6ylCr9REe5xAnKJiWXpixgxyfPYSY1+QpmUzN
 kefToVXjeQ0qOqKNUtJEKcxUxsdkvvaFUWA35x1IPqpcVKXelxuyiAKY30W9FnAfQfUuZ4nYodb
 JJwiFrUeApWfkmbgznN3EH6LZ9l5U6FBaYsEiao5gwcCI1THsAjlIep00nTUGH+RGSvAvcL2Lof
 b/ktgw+I82aY80PFuNfTB6JD651SnCHT9Rf7FMs6LfQ8dyZkYQQFcKA7JaZ190BzCHcy75tcApJ
 kwKTbMuoOgiZFwCOWHAdb5xNiWd9oqunpfBpx4t/GH/PibwDvo0=
X-Proofpoint-GUID: MHxIjA3On6a37zEK2w9XyKeLrV0Zh-K6
X-Authority-Analysis: v=2.4 cv=csaWUl4i c=1 sm=1 tr=0 ts=68f84e34 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=u46eEiAesJteSLRhgVQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:13624

From: Eugene Loh <eugene.loh@oracle.com>

Anchor links (links pointing to specific locations within files) are
broken, at least for viewing the Markdown version of the DTrace User
Guide on github from common browsers, in at least two respects:

*)  The arcane ID names are displayed at the anchor sites.

*)  The links do not point to the specific locations within the files.

The problem is that the {#ID} syntax is not recognized.

Replace the {#ID} tags with more universal HTML <a id="ID"> tags.

This patch addresses the documentation on built-in variables.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../dtrace_builtin_variable_reference.md      | 60 +++++++++----------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/doc/userguide/reference/dtrace_builtin_variable_reference.md b/doc/userguide/reference/dtrace_builtin_variable_reference.md
index 28b3001ae..787137929 100644
--- a/doc/userguide/reference/dtrace_builtin_variable_reference.md
+++ b/doc/userguide/reference/dtrace_builtin_variable_reference.md
@@ -1,9 +1,9 @@
 
-# DTrace Built-in Variable Reference {#dt_ref_builtin_vars}
+# DTrace Built-in Variable Reference <a id="dt_ref_builtin_vars">
 
 DTrace includes a set of built-in scalar variables that can be used in D programs or scripts.
 
-## Macro Variables {#dt_macrov_scrpt}
+## Macro Variables <a id="dt_macrov_scrpt">
 
 Macro variables are variables that are populated at runtime and identify information about the running `dtrace` process or the process running the compiler.
 
@@ -169,7 +169,7 @@ However, in probe descriptions, macro variables are expanded and concatenated wi
 
 Macro variables are only expanded one time within each probe description field and they can't contain probe description delimiters \(`:`\).
 
-### Macro Arguments {#dt_macroa_scrpt}
+### Macro Arguments <a id="dt_macroa_scrpt">
 
 The D compiler also provides a set of macro variables corresponding to any more argument operands that are specified as part of the `dtrace` command invocation. These *macro arguments* are accessed by using the built-in names `$0`, for the name of the D program file or `dtrace` command, `$1`, for the first extra operand, `$2` for the second operand, and so on. If you use the `-s` option, `$0` expands to the value of the name of the input file that's used with this option. For D programs that are specified on the command line, `$0` expands to the value of `argv[0]`, which is used to run the `dtrace` command itself.
 
@@ -243,7 +243,7 @@ To find the number of system calls made by the `date` command, save the script i
 sudo dtrace -s syscall.d -c date
 ```
 
-## args\[\] {#dt_ref_vars_args}
+## args\[\] <a id="dt_ref_vars_args">
 
 The typed and mapped arguments, if any, to the current probe. The `args[]` array is accessed using an integer index. Use `dtrace -l -v` and check `Argument Types` for the type of each argument of each probe. For example, consider the system call `prlimit()`. The prototype on its `man` page \(`man -s 2 prlimit`\) is consistent with its DTrace probe listing \(`dtrace -lvn 'syscall:vmlinux:prlimit*:entry' | grep args`\). Specifically, argument 2, if non NULL, points to a `struct rlimit` with the requested resource limit, which can be traced with:
 
@@ -255,7 +255,7 @@ syscall:vmlinux:prlimit*:entry
 }
 ```
 
-## arg0, …, arg9 {#dt_ref_var_arg0-9}
+## arg0, …, arg9 <a id="dt_ref_var_arg0-9">
 
 ```
 int64_t arg0, ..., arg9
@@ -271,7 +271,7 @@ rawfbt:vmlinux:ksys_write:entry
 }
 ```
 
-## caller {#dt_ref_var_caller}
+## caller <a id="dt_ref_var_caller">
 
 ```
 uintptr_t caller
@@ -279,7 +279,7 @@ uintptr_t caller
 
 The built-in variable `caller` references the program counter location of the current kernel thread at the time the probe fired.
 
-## curcpu {#dt_ref_var_curcpu}
+## curcpu <a id="dt_ref_var_curcpu">
 
 ```
 cpuinfo_t * curcpu
@@ -287,7 +287,7 @@ cpuinfo_t * curcpu
 
 The built-in variable `curcpu` references the current physical CPU.
 
-## curthread {#dt_ref_var_curthread}
+## curthread <a id="dt_ref_var_curthread">
 
 ```
 vmlinux`struct task_struct * curthread
@@ -295,7 +295,7 @@ vmlinux`struct task_struct * curthread
 
 The built-in variable `curthread` references a `vmlinux` data type, for which members can be found by searching for "task\_struct" on the Internet.
 
-## epid {#dt_ref_var_epid}
+## epid <a id="dt_ref_var_epid">
 
 ```
 uint_t epid
@@ -306,12 +306,12 @@ The built-in variable `epid` references the enabled probe ID \(EPID\) for the cu
 ## errno
 
 ```
-int errno {#dt_ref_var_errno}
+int errno <a id="dt_ref_var_errno">
 ```
 
 The built-in variable `errno` references the error value returned by the last system call run by this thread.
 
-## execname {#dt_ref_var_execname}
+## execname <a id="dt_ref_var_execname">
 
 ```
 string execname
@@ -319,7 +319,7 @@ string execname
 
 The built-in variable `execname` references the name that was passed to `execve()` to run the current process.
 
-## fds {#dt_ref_var_fds}
+## fds <a id="dt_ref_var_fds">
 
 ```
 fileinfo_t fds[]
@@ -327,7 +327,7 @@ fileinfo_t fds[]
 
 The built-in `variable fds[]` is an array which has the files the current process has opened in a `fileinfo_t` array, indexed by file descriptor number. See [fileinfo\_t](dtrace_providers_io.md).
 
-## gid {#dt_ref_var_gid}
+## gid <a id="dt_ref_var_gid">
 
 ```
 gid_t gid
@@ -335,7 +335,7 @@ gid_t gid
 
 The built-in variable `gid` references the real group ID of the current process.
 
-## id {#dt_ref_var_id}
+## id <a id="dt_ref_var_id">
 
 ```
 uint_t id
@@ -343,7 +343,7 @@ uint_t id
 
 The built-in variable `id` references the probe ID for the current probe. This ID is the system-wide unique identifier for the probe, as published by DTrace and listed in the output of `dtrace -l`.
 
-## ipl {#dt_ref_var_ipl}
+## ipl <a id="dt_ref_var_ipl">
 
 ```
 uint_t ipl
@@ -355,7 +355,7 @@ The built-in variable `ipl` references the interrupt priority level \(IPL\) on t
 
 This value is non-zero if interrupts are firing and zero otherwise. The non-zero value depends on whether preemption is active, and other factors, and can vary between kernel releases and kernel configurations.
 
-## pid {#dt_ref_var_pid}
+## pid <a id="dt_ref_var_pid">
 
 ```
 pid_t pid
@@ -363,7 +363,7 @@ pid_t pid
 
 The built-in variable `pid` references the process ID of the current process.
 
-## ppid {#dt_ref_var_ppid}
+## ppid <a id="dt_ref_var_ppid">
 
 ```
 pid_t ppid
@@ -371,7 +371,7 @@ pid_t ppid
 
 The built-in variable `ppid` references the parent process ID of the current process.
 
-## probefunc {#dt_ref_var_probefunc}
+## probefunc <a id="dt_ref_var_probefunc">
 
 ```
 string probefunc
@@ -379,7 +379,7 @@ string probefunc
 
 The built-in variable `probefunc` references the function name part of the current probe's description.
 
-## probemod {#dt_ref_var_probemod}
+## probemod <a id="dt_ref_var_probemod">
 
 ```
 string probemod
@@ -387,7 +387,7 @@ string probemod
 
 The built-in variable `probemod` references the module name part of the current probe's description.
 
-## probename {#dt_ref_var_probename}
+## probename <a id="dt_ref_var_probename">
 
 ```
 string probename
@@ -395,7 +395,7 @@ string probename
 
 The built-in variable `probename` references the name part of the current probe's description.
 
-## probeprov {#dt_ref_var_probeprov}
+## probeprov <a id="dt_ref_var_probeprov">
 
 ```
 string probeprov
@@ -403,7 +403,7 @@ string probeprov
 
 The built-in variable `probeprov` references the provider name part of the current probe's description.
 
-## stackdepth {#dt_ref_var_stackdepth}
+## stackdepth <a id="dt_ref_var_stackdepth">
 
 ```
 uint32_t stackdepth
@@ -411,7 +411,7 @@ uint32_t stackdepth
 
 The built-in variable `stackdepth` references the current thread's stack frame depth at probe firing time.
 
-## tid {#dt_ref_var_tid}
+## tid <a id="dt_ref_var_tid">
 
 ```
 id_t tid
@@ -419,7 +419,7 @@ id_t tid
 
 The built-in variable `tid` references the thread ID of the current thread.
 
-## timestamp {#dt_ref_var_timestamp}
+## timestamp <a id="dt_ref_var_timestamp">
 
 ```
 uint64_t timestamp
@@ -427,7 +427,7 @@ uint64_t timestamp
 
 The built-in variable `timestamp` references the current value of a nanosecond timestamp counter. This counter increments from an arbitrary point in the past. Therefore, only use the timestamp counter for relative computations.
 
-## ucaller {#dt_ref_var_ucaller}
+## ucaller <a id="dt_ref_var_ucaller">
 
 ```
 uint64_t ucaller
@@ -435,7 +435,7 @@ uint64_t ucaller
 
 The built-in variable `ucaller` references the program counter location of the current user thread at the time the probe fired.
 
-## uid {#dt_ref_var_uid}
+## uid <a id="dt_ref_var_uid">
 
 ```
 uid_t uid
@@ -443,7 +443,7 @@ uid_t uid
 
 The built-in variable `uid` references the real user ID of the current process.
 
-## uregs {#dt_ref_var_uregs}
+## uregs <a id="dt_ref_var_uregs">
 
 ```
 uint64_t uregs[]
@@ -451,7 +451,7 @@ uint64_t uregs[]
 
 The current thread's saved user-mode register values at probe firing time.
 
-## ustackdepth {#dt_ref_var_ustackdepth}
+## ustackdepth <a id="dt_ref_var_ustackdepth">
 
 ```
 uint32_t ustackdepth
@@ -459,7 +459,7 @@ uint32_t ustackdepth
 
 The built-in variable `ustackdepth` references the user thread's stack frame depth at probe firing time.
 
-## vtimestamp {#dt_ref_var_vtimestamp}
+## vtimestamp <a id="dt_ref_var_vtimestamp">
 
 ```
 uint64_t vtimestamp
@@ -467,7 +467,7 @@ uint64_t vtimestamp
 
 The built-in variable `vtimestamp` references the current value of a nanosecond timestamp counter that's virtualized to the amount of time that the current thread has been running on a CPU, minus the time spent in DTrace predicates and functions. This counter increments from an arbitrary point in the past. Therefore, only use the vtimestamp counter for relative time computations.
 
-## walltimestamp {#dt_ref_var_walltimestamp}
+## walltimestamp <a id="dt_ref_var_walltimestamp">
 
 ```
 int64_t walltimestamp
-- 
2.47.3

