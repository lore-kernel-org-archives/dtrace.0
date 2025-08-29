Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12F228640F
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 07:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756454346; cv=fail; b=rE+N4UfQh9T7G2uj3kI3Hs2IbY53cyezE3+sYq+091s5Hl8xmW+qpTAM9FJdk6il3yhP2gJ8IhMx85QW3YU+5i8ybR+MF4YF5vi/VsSDesV/V2bLGLX/P/zx13e8/Mj6jppNwueqT1g8XCfJ0UEVPSuBcWcgrfAARi88Gt14+K4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756454346; c=relaxed/simple;
	bh=SEIDCovtcxpcJc9oVnPKsocMQ/3OYFv8fhsrH3zOqZI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pBeFEzDvHUW9GPDeSMz0pG6TVwQ/qZr0bzWm8oDFTaecQkeI8WfOjD4xi+4B7g9ArK8OCxeTRhn78xknIP5N4pVbOZBDXmjivarzrEHedkDiQCMfl8vY0VW8TIPOvGdENIScMZ/e2cnb20KhplIU2GS+DffSb13b2nhrynXkZyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ioNO0aGf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xTXAm7NB; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ioNO0aGf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xTXAm7NB"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T1gPqM017136
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 07:59:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=O4HOYWI5ybuom3sdGUPlfDmc3tnk7118Ns7p132SQk8=; b=
	ioNO0aGf+NV5jzO2XhBmyS836rZN+fjpoQHwCnAqrr92NuCKPFyegn5q0iOQq0eA
	RBFD4LrWqQxkSkNj0kL53+Ab2fa3qocH+3YldPJrGYm8qhwHX2mR5nkYI4v7Le4+
	yRhSCUKL+9kRx2WxuhgL92HlOWTs8wvxt1hWu3ILdSkp9m5Yp4QTPae6xIAxaA1T
	WgTQ+TCc44QJmKLRwazN9LEoVxpzBnWFNmCIxiErPe8r1OpdFYm2Wapmmq23y2+u
	QwLWqGnLJmRptDdSxmCV7fqgLpaIORSw5VkgCrxedHXyy/4k50BoF5q4oBV+BXNZ
	rJi94kDk3b6Kl8Y7Xqb87A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q58sa121-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 07:59:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57T5mJF5027103
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 07:58:59 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2066.outbound.protection.outlook.com [40.107.94.66])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48q43cqchn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 07:58:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWal0TF0TluRPe++uDHnhBr8Nx77FQJs+fsWaLSrDJZu8cx6yppB7JsEfYmh294QKm7rv6J2Xu5XTokyLCdnx5XrbRd6SZRdkKf+jGUmvmnIBbIH7gZ69Mo+WSR72zc+DlJv88zZIxnAvHh6IUqz/6FK4eJ+LZAChZqK6lAaan6XnQLlXe2F7ega/MGtcKXn3cEO7D8c90FQAPymEMe5zQ+94GkafsaupFWOUNpPgainolT8YSDNEwdkrlAwoMFVVmJAck8AiG0NX/XCsDkQyxgIFF6LqX5Vvx3kzR8vSmP/DA8M2cHSGvwpXadYAhGvqsoYyUgGmVJdfikwEEyaGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4HOYWI5ybuom3sdGUPlfDmc3tnk7118Ns7p132SQk8=;
 b=PoezRRmEgGrb759hNJ86Q7uPW3SUbAYMtDdQdXd8x9yI6aLHqTLnP7goZDVZckDA2WYxbYc9dRbk/AIo04HxtHvEeirkX7n+Q6b0358gd6Eu5rBsIsc+DocL2X2AY3XWv+fEfEPfAQAlzQq4iUrI+W7UPxISK/+fJUhFHX9ygZoLCncI/thu9ahugKhuLmkyipzMDiyjSRw8y2R7lgnMclEEav5RR6dhaYtBs7Do0YGEl3Wt/yX7Rmr0w9BwjwpQ6ZFOiYhCBKzm0jB2XTRibykV4vWV8uIxjFCBwW7J/qDlov+VhKS79yCgS2iUN5xAyoXhSkOwpJ2fhZhTm7cUrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4HOYWI5ybuom3sdGUPlfDmc3tnk7118Ns7p132SQk8=;
 b=xTXAm7NBdfsmwRcV2lrXBlNxPlTKdgUSy4hpWI7ged4+UXWTgEX5tLWteC3D1dq2cQPx4u34xK99daRKIKIvWN9d6OnscLerpzIiRtiFMk9NyA6KlsIsyjVit9mWHUppBlTuZNNVJ4EzxI88+mu041PUECVBA1KSQNaeIbGzCGI=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 SA2PR10MB4460.namprd10.prod.outlook.com (2603:10b6:806:118::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Fri, 29 Aug
 2025 07:58:53 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%6]) with mapi id 15.20.9031.023; Fri, 29 Aug 2025
 07:58:53 +0000
Message-ID: <b3b85cde-d3a6-4cb9-ad5f-c52becfbba67@oracle.com>
Date: Fri, 29 Aug 2025 08:58:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH 1/5] udp: new provider
To: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250822181629.30972-1-alan.maguire@oracle.com>
 <20250822181629.30972-2-alan.maguire@oracle.com>
 <1fd04dcc-4c22-cf62-c050-19b22b1dfa0e@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <1fd04dcc-4c22-cf62-c050-19b22b1dfa0e@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0388.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::17) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|SA2PR10MB4460:EE_
X-MS-Office365-Filtering-Correlation-Id: ee62d878-6f0b-4e66-991a-08dde6d1e569
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Zld5eDMrVjVURXh0VUFjR255N09BbkgzMWovTXdNTGNHdWdDSFljb3FBaUJt?=
 =?utf-8?B?c1FVMThiZ29CODNXVkY4ZldtVThIZGh1eEJIYnRtQTRkYUJLaG14blRiSlpB?=
 =?utf-8?B?UTREVEVtRnBGQnBDMll3TklpNSsvV09SZWZIVGpHemZ5MHNzNElBRy9leVFy?=
 =?utf-8?B?bnozMmVRL09PTmIrc1JzeExsZWZkUEw1Q3RYL0Z3UXZVazR0WkpqalVIR1Qw?=
 =?utf-8?B?K2ZGUjNJUU9YWE5YK0p6MW9CZ3Q1Q1FrL2pvbkE0TGk0bHNSbE1EZllqeEdY?=
 =?utf-8?B?ajZKN1lNZFVYdVVWcEtYUXQ3cEg4ei9HSGdvKytGQWJGd1J1Z0FJcEF6emJC?=
 =?utf-8?B?K1dBK2tqNEtRd1llQkd0ZXB2YjJnbnpEc0dySHV3elkzcDhrWm16R2pGWEJG?=
 =?utf-8?B?cExieS9PR1B6TjNzaGkyeVJWNStCODlQY0ZUUmpWSFVYUTJkWGpBOFJTcEpZ?=
 =?utf-8?B?OWZkR3hJUWV4ZE5kcmEvZHBCVjU0NzBQSGZwc3doZ1lGY1ZrOUFLRnlVb2lN?=
 =?utf-8?B?Q1RUTVJhWmt6WjF5ODdyeTI1eXU3TXhsMDFBakVoVm1mY3BrVmtyQUNvaEVh?=
 =?utf-8?B?RGFHR3BkdHNScit5NVBTSFdQMWRHZkNsWk1ob3JRQnI4cmtqa0FoYjREMWtQ?=
 =?utf-8?B?aFN4aHg3UWRpdWRLSFlacG1namVMYUNTczlPbHZHZncwMmxVZ3hrUWJkNmZT?=
 =?utf-8?B?TFhWV3QrdkhuQzhhN1hPaHlMRFdyZGNmOXgrUG1zT3RUYmloUlhWVUM2T1BP?=
 =?utf-8?B?TnlVdDM0am5tSFMxeGU3V3ozSkJVdm4vRXQxYVNTSFhWcGR3UTJ5MVROVzNI?=
 =?utf-8?B?ZU1FZTdrOE92K0s0S09QTEo0aUQ0aTdvMHduT0k1OXJqTXpDbXpCY25HNXdL?=
 =?utf-8?B?UkErc003RzdjSW9KOFZsUDBzR3dVc2pnYzdYMnBpeUR3L1ZFSGFRUDVwTVY5?=
 =?utf-8?B?ekFWUGo1Q0phRExZenJrNWc2YXdKa0JlaWpaMGxrUE1hWEYzSnVIYjlpY0VQ?=
 =?utf-8?B?aTYrRStDMkF6Sk0xdlBycTFtWitXRUF1VGlGcWh4SGk2bmcyMmNMckJva1pB?=
 =?utf-8?B?K1lwR0FnRVZZWWtjNXBiY2s4T0lIMHk2cXBxeEcxYUxwVGxyZE92K0JHMDg3?=
 =?utf-8?B?aCtLK2FlYlQySFVoRy8ydHdtZjB4dDZpK1doczJyWXFUY0FrbkdwZkZmUEU1?=
 =?utf-8?B?TEpMVnpTS0pBKzd6L01CWDNoQlNLbWZDZ0tEQjdnSnd4NDcrcnVWL0VHWDJK?=
 =?utf-8?B?VE5uUHNkN3ozRVpxSDNCLzI4MjRvOFNNYTNOWlg5Q1dhQ2Z6YmVid1MyUkpn?=
 =?utf-8?B?aHZteUdNdm9UOE1QUXF5SFptdG5JVGZYdk5Qa2ZkRWZ6OGRUcmNjaFIxVDlZ?=
 =?utf-8?B?dVd0L09pd2FQZEVVVlE5aUdjbmFYRENoWTVUOEhjbUhYOTR1NXhQQmxMNUg3?=
 =?utf-8?B?OGZxZGVUY1NjaEtDcDYyaXdDdzVTTDhBbDdUN3g5SnBiUkUxSU91WlZsbVFJ?=
 =?utf-8?B?WVJseGY1U09DK2FQMGpTWjdQWWc1RVdzaWNvand3bHZncUZwWVJRQk5FUjdY?=
 =?utf-8?B?OXRHVHB4VnhWQ2htenlTam8vUksvSnFlTEJwUDVRRU01R0lYRGRHQzl2ZStY?=
 =?utf-8?B?WjJYVFRSQ3YxSHZZWXdnSlhpVDZHRWtrZkxnNEJST1JyR2JpTHFFMkFYdHJG?=
 =?utf-8?B?eERYU05CSEVOdCs3V1htK012RVZJWUpUTkR5UlFMdEZqUDZaNlVFMDBGZitL?=
 =?utf-8?B?YzZtV2ZMaW9hL09uN0lTNVF1YVdaVVlTajcreXNuSzArdE1ZRWcwR1Bwd3Fv?=
 =?utf-8?B?N1dUczAxcFR4OGdSTXltb0ZLeGFFNS8vS2s5b1JIOExrSFVmeC9aNm5HYzRm?=
 =?utf-8?B?cmhiV2Q5Uk5MQ0RXUTEyRERRK1NLOGpJRElHUlNxWWg4N2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azh4M0Q4YVpRcmV6MktqNmlrc0NXZHdTRVVCUWVlUWtNenMwRFEwWTNXc29F?=
 =?utf-8?B?eTJjc3BGME9ESDc2TkhQU1dkR0JBajBkM3Y3ampHdE5nVHpKTnBHc1h2bDg3?=
 =?utf-8?B?MFo3bU0wNXMrMFA4eW1qN1BVSWk4cXZCTWk0VXNGcTd1WXZiOWpsN3RNZUhB?=
 =?utf-8?B?M1haZGF3MFNqUkM4MnIxVWk5T0FvZ0FmRnNnOElBQmtjeXVjdFgyWWNCTk93?=
 =?utf-8?B?ZzhTa0NHV0lySnBHazhST3VGTlN6S2FtbU9hMDhOT3J5VDVEa0lZL2xLYVlt?=
 =?utf-8?B?RWFiTVNKVGdGdlFYaE1wQ3dTM2lxT2VFSWhpc2hVSi9Xdk85TGdGMmRBRWlQ?=
 =?utf-8?B?bmpMaHJLbE9FZkV0dkJ6c3FtMGh6cG5QWVpLdmtzQ3g2ZnhvV0dJL290bTRY?=
 =?utf-8?B?RkkrT3dTdkduWC94MDExeWI5ZDJkbzlhdElReE40aGZHVmh0SDhOL3llMnhx?=
 =?utf-8?B?bnpUK1VreGZFOU5sS1kxMFRpS0djOEpQQm56bzVJcm04M0lEdWhlUXNaMDZy?=
 =?utf-8?B?L3Q3YTVHZzVnY2lWOUNETTRoU3g2YmpmRDZEQmFVRkIzWU1iZm9PV1hWT1dF?=
 =?utf-8?B?UlVsbC9XY2ovVGlyZ095b2xEeks0MVo4VC8rSHpubFJkOFBOVVQySGpnMzIz?=
 =?utf-8?B?ZHM4dnZ1aE1lb2E1WjJwdVdhSGJoUDlyRlUzNFA4Zjc2NGFVeThxS25BaGZL?=
 =?utf-8?B?bHIvT3MraEcvY014eW02U1k4ZWcxT05nMGxKNlQreDQ0S3c3QkJYZ3F6L3hu?=
 =?utf-8?B?U1ZiWVl0b25CZnZzRDRLL1lWdnB0c2hGVjZWZUs2K2RjK011NUpFSmJpYk0w?=
 =?utf-8?B?RDBWemZ3SVNlU0dCd0dlY1lwb1RkSk9OZS8wbkttNXF0VGRCUWxZWU1YWVFz?=
 =?utf-8?B?QWEwK3d5bnpmRDViMHpQRkZ1bkpuY2tHVDJHVU91WmRMbnNmNnpDa09tc3Rs?=
 =?utf-8?B?QTVnWUpROWZYb0xaWlhMMzk1NXBEV0FaelQ3U3ZTVW4xL2ZyVGVMQnllczJy?=
 =?utf-8?B?dU1pZHhtMHh4Z3RiV3JzbE5zekU4amJMdkIzM2VVRE1QL3ZyUFh4a0pZZGxH?=
 =?utf-8?B?RXhKT1A2QXZ1YUhLZ2J6SjdMc1g4VmpEcThwWWc1U2NEWTdOQVZQdXpwMVVx?=
 =?utf-8?B?WGVFZ1RKa2N5ZFIrUFVleE9xa0VWRTNublJkNzR1R0hGK1FsTnFHV0NsWXZF?=
 =?utf-8?B?OGxMaG1oU29YdHpXZzBzdlVvNlllTFVRem1FZkpxdGhvOXhJbFNzV1RwWEQw?=
 =?utf-8?B?U2xwOWRCTEZjQ0ZaUnNTc0RScFNpNlJ2U3llWE90dk1XeC9jbVRMV1hjVjhm?=
 =?utf-8?B?QUJMWTVqS0daM2plYi92UFhJdE1GbktJTUNNYVZGbEtoS09Kb2FjYS9SRmlR?=
 =?utf-8?B?cFg0NWhuQVM2NXVWVWZSbXdWVThKaVc1UjBzcG5qdFpHeXU0VzB0TTFNSzQr?=
 =?utf-8?B?THRsUWJPUGtHYU9zZHcvQVN3S1pJb0liRWMyRFJBTHRSc0w4ZXFwalVrU0U1?=
 =?utf-8?B?SHFmVnBzWnYvSGhSbWgxS3YyWkY0a3VzalR2TjkzOTVnMjFHbzZKdEVkTUV2?=
 =?utf-8?B?VzBBV09XSnpmQlNZKzNEN2FOalRPUHp5VVVEcHVGTmMzQXlXVUd5aXpqR0xi?=
 =?utf-8?B?MzgwRTgyUlFMcW5qZ1o5djZyclBNUlovUk1vUlpkaWpLaWNBMHFpSnlpWDRY?=
 =?utf-8?B?S3kyOUJPTHc3dnl2TGs1cEJURHBOTWtqbEpXS3RpRWFKa2NOZGpEaFRPTGhO?=
 =?utf-8?B?ZlNuRGhtN3M1UldvczgxTFdyd3JKODFnRGdxTUE4RnFNaGlSWXZhVlYzNVhE?=
 =?utf-8?B?bzN5WFVJT3VMT3lDbFF5MDFGK3dBb1M3U1FSd2l3UXFiUUxQYUtMR3BzSWQ0?=
 =?utf-8?B?anR6b0tENkR3b0dxNG5LL0FOeW95NlZBZzhJcStQVGp0YVk1eTFNdTVEb0dG?=
 =?utf-8?B?bjFTUEt3aHlPWWZjVGJxaGNDY1M2NDlNeWFrWFA0cWNiY0JFeGhXZnJmNjlP?=
 =?utf-8?B?VGorRkJIckZXRkQxWHh1ZENWZC9UYTdRWVhUZnNoenJFYTduRVFPbjNEdE1v?=
 =?utf-8?B?T25lQUlLQ2dYU0I2VldoVDUwSTJSWE5rZjBwUnhtRTg5dFNydmNxbVRONWNM?=
 =?utf-8?B?U0VQV1VqZno3eVI1U1Z5ZW81bXJNV0ZQOEtRQllIQ05pQXZqZzMvK3dvaHcx?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jlQeron55cLNrHmidXUiw2J6hPhit2aFx6TyygDrI+QjSxqFmFzLbgzIGhnLQxFrtkijf881tJmVU0pS+CPlvHODL7CNvPfDYswi1N7xUZMuVBYe0ll1YK/SieK/4P6LfVrYeyS7bNlPIkDz0TL4As5CquZ6YraoYRSUyHkFe+AIqrxuz/hlqgJkXWjzEsEhonU2e4IISoo3j3Mr/heY/31nLdv229UUdrpJ3YIHi0IrqsjIAl6Dv5X6aOe6HsLm5glzq1o2esxu+NwMcBRKmlDY1ZXx8CLqfnnoXUERN2sWBCNd1qeUo9V6bzCS88mZ6cAgC9ttG9+HOCmLzeLfyvTyC5PWG8u2jJQZaYYFE5H+zhYetBdCqbHR5rAtUCxff2gM7OgJbuoikFmx16udtjv2KHJTgXuTTe6+J0bhyJdVDQ7qgvqAnN43XLve030p765rlAtKIq1TaUoybReSYqUKRhg6oSvxtewT0XmESJdYLCNUf72BjUSEnomfP58paxZbI3trbMAlptdbj9mezuxMe5XaDf4z57F2ObHpum7kDYc44+2CQhxYEFOGLBfUaAn3e644KC9Ht0vX5vSVyeIPlmrfNrr15nzNmHmfp/s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee62d878-6f0b-4e66-991a-08dde6d1e569
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 07:58:53.1444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qf/KAzrekkrr5H83FkWXYswjaGbxxtQIiByeq2j/B+1yvbMouWpDyeinf9YrhAu0lW9TfNwtBTosXddwWRcc4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4460
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2508290066
X-Authority-Analysis: v=2.4 cv=J6mq7BnS c=1 sm=1 tr=0 ts=68b15dc7 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=gFTy3GVuFM-sMFyY1ccA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Z25SNJKxvFw-DtOx5YnwTVJ_HHrJ7VrZ
X-Proofpoint-ORIG-GUID: Z25SNJKxvFw-DtOx5YnwTVJ_HHrJ7VrZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyNyBTYWx0ZWRfX6kbXNXVJngSy
 i3CtKduFprlse/rbhOaIm+Vck5f/gT58dt0DFbv7QJJlRqZcSK8LSElt8LUHd06PVozqlUFTJ4P
 YA1sLKjaWLSqSgHqXpVYgL6NV3EmSuprsG44SIz09kM5y8hFPGM8jKMw/X2FM1btSpcCZ9guNMu
 REX5UBFC6Plk8niXANNkTEF7iyD5wC0/Q+FlvQB0QOUFGSYeEWegXwPOmGQygvIVoKW2sUUfEov
 kz9U1Sk2crPW+JcLSrYEV2FLuNjKQz02OAYxEXotvKWZOEtNJ3/a8aj0wsn337buVLrJUF37CEy
 r96ADb1hGtTsbA90/w9kyJkLouS80KmU6rH3iQ2FwtvuhkHRib6eV+Wgdr5crzu0dY+DfkzjXrX
 6g2IXpZ6

On 28/08/2025 18:56, Eugene Loh wrote:
> FWIW, we should have the "cg: fix offset for > 8 bit bitfields in
> dt_cg_ctf_offsetof()" patch land before this patch series does.
> 
> Anyhow, testing x86 and arm for OL8/UEK6 OL8/UEK7 OL9/UEK7 OL9/UEK8
> OL10/UEK8, I get
>     test/unittest/udp/tst.ipv6localudp.sh: FAIL: expected results differ.
> for
>     x86/OL8/UEK7
>     x86/OL9/UEK7
>     x86/OL9/UEK8
>     x86/OL10/UEK8
>     arm/OL10/UEK8
> If you like, I can investigate more or report more details.  I just
> didn't want to dive in too deep without checking in with you first.
> 

Thanks for the additional analysis on these in later messages! I think
given that udp[6]_queue_rcv_skb are static - and hence can wind up with
"." suffixes and not be fprobe-able - it's probably best to convert all
probe points to use rawfbt here.

> I do not know how documentation will be handled, but it's possible we
> will start to see that become part of this repo, in which perhaps new
> providers need to be accompanied by doc updates.  But I guess that will
> be the burden of whichever patch comes second.
> 
> Why is the module for these probes "vmlinux" when not all the underlying
> probes are?
>    ID   PROVIDER       MODULE                FUNCTION NAME
> 75616        fbt      vmlinux       udp_queue_rcv_skb entry
> 78708        fbt         ipv6     udpv6_queue_rcv_skb entry
> 74498        fbt      vmlinux             ip_send_skb entry
> 77968        fbt         ipv6            ip6_send_skb entry
> 

It depends whether CONFIG_IPV6=y or CONFIG_IPV6=m I think; not sure how
to reflect that dynamically in dt_sdt_populate() tho.

> I do not understand why the arg5 trick is needed, but I trust you!
>

It originated in the TCP provider, where checking outbound/inbound was
more efficient than a string comparison on probe name, especially where
there were multiple inbound probes like receive, accept-established etc.


> On 8/22/25 14:16, Alan Maguire via DTrace-devel wrote:
>> Based upon fbt probes support UDP send, receive.
> 
> To me, this would read more clearly if it were "Support UDP send and
> receive, using fbt probes."

Sure, will change. I'll also squash some of the patches as you suggest.
