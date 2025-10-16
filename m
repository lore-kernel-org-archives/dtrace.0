Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FC42DE6F4
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 20:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760648055; cv=fail; b=VocnMaqX6Cxp+Ej/F7YhI9EOhuq8oTxjQ8ZHl988QMVajHISmPaKIC4/n0ACNXsjjFEY+fprAHR2BHn3R8nHK+Mj5Qmn60A+fPbg4+IhMaH3In03lEXnei3nZjDdC7yJ2VOcvrXJnWEQz4zB3GZGjgXk9cD0SOHqb283W8HP3mM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760648055; c=relaxed/simple;
	bh=tyqlSJftEwkguxxVJmdz5GSjV8xCCRXerXH2NlzP90k=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=MC8WJLzDeigbeeYlJQRxhEKxEr2IdvCxHY3Aa17UKwG575pEkOjCnoq7X9cjdJp3EmCbeoJ6mvAC+Mbt+AHDDh3hxmzjhkqRxwupU+8T1vunAgomX7/40fczOrvPk/AmRuOwmMm6lT9OPL84ofWYR/wGBwDUzftVSmQZFtJvJvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZOOkbZ5s; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XJHeDIEC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZOOkbZ5s";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XJHeDIEC"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GH6LMe016397
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 20:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=IduZE7+bQhs7MhYA
	XiG/2wGGZZL4AaGbde+hD5Iw4bQ=; b=ZOOkbZ5sy0FTLMtECyEIdpAaW9kInOTY
	Epwe9UoWVBFJkDWvgMAcIbu+Cak8SYkE0HDGlsGX3kXPmScTCWPu6QRn6aXJppm5
	1PgnJAlAw1sUXIG9oY6mq/b+geYQXxpIgZHujiN8rB2I0MrMg5WUqHrXQb5d++kE
	0oWyQ0tTpHg8zsmd3jeLSLJkCg3SpfAEGasbSZBXrXvX4C/NIlFbFgyo1IWsFH7/
	4wrQqiAj12s/ApEe0xewA63WZQKB5zBfjCgklbbflzgGZZW0QsZR+xGtryEAQ2OK
	uOSotz7FYpRXns0rLY5cKXEu/78MzO6+pjduJSdMzqMD0L9UkMyfUQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qfss1rta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 20:54:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59GJGZxG025857
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 20:54:10 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011060.outbound.protection.outlook.com [52.101.52.60])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49qdpj82b1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 20:54:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HD1lOSYzXHzvi9ea52pg2+n6LuqY5ekqM/jCt7VwAsj6W++Ct9DuiIZjO5vHcJKNMUIH3HPHNcGGrzoaGe1TjDyPZU00Yu8DnxKxyTzQwDB6PyxMc0ICansq95WpeTaK5emfgXTPsv0Ez7XQCncgNRQ2k23C5Z/LuqH3T/efDtvEW9YZULCkjbrjhpKzmA8T0Baw7Xu0BAl5GaZ/yseBML7JDVigTQ2zZmIe/kvFsiMkqtxHiJ2eyrseqLP+JwSzVn4LpJ9GocdZrLqmpc7V98WxJObVefu+h19hr1iij8M13sJowl5yznhaF5pR/ApmDvp/CynCw+F8ueFYI/iQiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IduZE7+bQhs7MhYAXiG/2wGGZZL4AaGbde+hD5Iw4bQ=;
 b=LzRwd/o4lMxFLlRoAaxPtCAuQeohGCCxBkEiKoD/7e6ObTaqQTHEJmPwTjsCPAeq2lTjyZhgBJrqHQE8+3OpEubBic2w35y5f10Mw8Z0mNmhCZVVuhNvvFv/fXKUWGhMkOj4ik0VPaeoeRP5uHH59Kwbt4dgGPolgtgXR7HGdt15NG7JQ1jfF1m4B8y3JEMfXgKCCeQQVHYUPkHlPGc2J61KAu87WnBopO59nQDVk376ZH3yemApNnGPGkJyTwECoeq0NgFdGOQRUnWAHSiJ0jgSE/yKB3znHedPYVEJOcQkK2LpoIB86XDBU3FbqFwdbrWOQH/68sDFBHOukOi2NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IduZE7+bQhs7MhYAXiG/2wGGZZL4AaGbde+hD5Iw4bQ=;
 b=XJHeDIECyv7wVUsm7HIVGmACtMEmTv7PknYYuMrPVAKbruGZuOTtdnzFXybSr7JHcQi7U4QOnqWDtgFSKNt8CVz0MaQ2MVQ4x3XfU6TU7khrlTEsnBNHAw1YL/IGAg7HpsOrmxVKvlTX58576aJr1B801/dDn7gv88uTxW8AWDA=
Received: from IA3PR10MB8513.namprd10.prod.outlook.com (2603:10b6:208:576::12)
 by PH0PR10MB4472.namprd10.prod.outlook.com (2603:10b6:510:30::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 20:54:08 +0000
Received: from IA3PR10MB8513.namprd10.prod.outlook.com
 ([fe80::dd32:577c:40ed:9823]) by IA3PR10MB8513.namprd10.prod.outlook.com
 ([fe80::dd32:577c:40ed:9823%5]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 20:54:07 +0000
From: Bruce McCulloch <bruce.mcculloch@oracle.com>
To: dtrace@lists.linux.dev
Cc: Bruce McCulloch <bruce.mcculloch@oracle.com>
Subject: [PATCH] Update llms-txt and add README
Date: Thu, 16 Oct 2025 13:53:29 -0700
Message-ID: <20251016205330.4055747-1-bruce.mcculloch@oracle.com>
X-Mailer: git-send-email 2.47.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0054.namprd03.prod.outlook.com
 (2603:10b6:303:8e::29) To IA3PR10MB8513.namprd10.prod.outlook.com
 (2603:10b6:208:576::12)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR10MB8513:EE_|PH0PR10MB4472:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bafff85-1b8a-4a88-ab89-08de0cf6262f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cloyL09RQllGMlVUSVNnUlFOaVd3RWZHQTh2N2tJWkhwcEdLeGhSVDgxQ0dH?=
 =?utf-8?B?K0pIV3lQeG1YUld5bHZtL2lCNFB4Qm5ZVnhWM0ViM00zeHV0TnUwYnRHZmJh?=
 =?utf-8?B?cnE0bFZWYTRFZGRHVGV6T0lINHJzZDRIa3BTQWtzdGkrNFRyWmVCbFNiQ2No?=
 =?utf-8?B?UWplZ0Rpc3NHSHkzUzdiZmN3UGZ5dkJ0VUQ1a2xNb1A0b1N5SU9TdDhtZkRx?=
 =?utf-8?B?QmJ2VFpDMDVWSFRWUmU2ODFvRjRCek83Yk42dFFTVkpRUXFub2xZckRzcTNx?=
 =?utf-8?B?L21UVVJSN1IzTEtRNmQvYmo3YXFzN0xCb3NaUjVIQWhZbHVRbHhkU3VJU29O?=
 =?utf-8?B?OUdEYm9hQm5YVmVNQVBmWHh0ZDMrNXJpNEJYTUcya2FmUDkrTFJSZmtubUtN?=
 =?utf-8?B?SEpXUjl3UElxSFFESFQwcU1MdTF2aXRLZjFRalh1SmZTSHNnUUIySjIrYzBO?=
 =?utf-8?B?K1Q2aEtaR3NEVjI2Y3E0RUp0Nlk2aG9WYmJVanhLb2hQRHkvZUdYaVhvb1Zy?=
 =?utf-8?B?ZkhiZFZvRS9qelJGK2ZWZG5HTzlsL2IxSkMrUnVvalVlcHN5dWdrZ3BnbXR5?=
 =?utf-8?B?VlV0WFptMTA0Qy95dzluaTVwMjRvZHBXOS9oRHVlVThoS2RSLzNHa1dHZkxp?=
 =?utf-8?B?a05BMjZicGVuVDJHZU9qdFpIZGNWdmxxS3YxQ3RjQlBXWDRGeU82SmRWYnJG?=
 =?utf-8?B?aTVzbHZGeUo0d2U3UE5mUXJGTVZzU0RlVDNxV3NOTWx1UEJyZHdyQkduNThH?=
 =?utf-8?B?V1NqYkF6ZEJsTHcxOU1WUmdkUEZVTkV0MzBCRUptSERZdDk4QTRJZHVFamtt?=
 =?utf-8?B?dzVheElaRVQrL0VYQ2JEekROWmtySGxONjBZQVdqaXZ4bjFvY0FOZ3o3ZHNR?=
 =?utf-8?B?S2J5V21zYVFzaXhTbjU2N1RYbWsxTW1IVThDUGlrRzA0cVRYVzc4b2lmL3M2?=
 =?utf-8?B?RnFMVW9xenpuZEN4dGMxQlVObmxnUGVEVlZrZWNqUzh6YWh4T3ZZZ052WmlP?=
 =?utf-8?B?WlRReTk5VGt4NkJ6MUdMN3NFOHYwaU01cGdiVk9PaDFqNkJOd081SkdYdnNv?=
 =?utf-8?B?Ni9saG9lOVEwMllSVFlkSndoOVpNaUpnNDI0WkRqd0Nmbkg4ZXU3ajQ5UkJk?=
 =?utf-8?B?TE8xSG1jYzFwUGRVelJydCtEVVorenhUMW1JTVM5Y3ZnT2JjODZYNjlLUU9p?=
 =?utf-8?B?N0RHenFpeFhTTlZEblFyUWt5NDk2bEs0RWN4RVZkbG00YUIybjQ3QUYvT0Fu?=
 =?utf-8?B?NE1Nb0JBSENQVS80Ly9odmFoK0svR3FhMFloVkRxaWQwMWFjbmtBSVZmdlNY?=
 =?utf-8?B?T0NrbjZUaXNIeERwdEo2My9raG1NVEZnVUlmTHFDR3JJUU9vMGJIQ1FPbkFL?=
 =?utf-8?B?TEI1Q0FLMHJpWlE5SG1Pa2pXeFdLSWVwZTdHbjhMekowSEw1YWZ5a1ZPWDlw?=
 =?utf-8?B?WkZvcTFoU1dsL3hEMmtiL2dTT3ZkdWFuUS9QNmlxOEMrRTJSRit3WjF3Z0NV?=
 =?utf-8?B?MS84MFN5UGVSY1dBVWtQUGdoUWNuTHJWaEM2RytxblZXdys5SkgyZHNDSnhC?=
 =?utf-8?B?Mkswbm9lVzBFUkdCdVBoY1FhSU1PUzRITGlHYTZNQS9aNTRzTndWYkhybTZ5?=
 =?utf-8?B?UzFVRUozaXF4NzIzZWZOeTlnTVRQcFRHcmxmKzBsbXhoTVgxaUJicTdTazk1?=
 =?utf-8?B?UlNScmQyam82b3Rwbk1CNUlUcVl4V0NrdHc2NC9POXpvcmhsWC9PTmU5UUdt?=
 =?utf-8?B?NEdlNHpJQUFiRXdXbjhMRXoxdlVGRkVNRDM4NDZ4dGFrVG1vUTZnUW5QUDZq?=
 =?utf-8?B?NXp3QjNacmx1WXpSNXVpbStIa05GejRFcjRjdVlXRVBqUTE0eTJ5T1p5V2Vt?=
 =?utf-8?B?T0RBZ29ZbTcvVnl2UTEzTmljWUlrM2IrYWJQcUt4TjkrWXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR10MB8513.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGUwU05vSk5oQy9mVE10K1VIcDgvdWNZaU55UlpXcjQrZ0E1VmR0N0krVlVn?=
 =?utf-8?B?V2pSTU15NXZZS3BtVG9Pd294OTIvL0YvTzNtc2oyU0xmLzZRNU4rS3RRcktE?=
 =?utf-8?B?UVYrbU9DMU0vQW02T2s2d2JsUTJHT1BXb09YZXRQUnc4K1lXMFczeUVrTzh4?=
 =?utf-8?B?RTdydk8xaEgydTdGVUt3UlpaL0hnLy9ZRXhJM0NUZHlKNS8rZTBvSEhaSXFp?=
 =?utf-8?B?bGtvT21FdmFBRXVyaEQ3NW5QTUNlTExiajRiMGl0S3dSYll0cmdZYTBrbVVn?=
 =?utf-8?B?TlBVQUhkRjE5bVFJdDQxeWdlRmd5eWNDR2FZMkF4VytlbnNBdkhkUDF6MEo0?=
 =?utf-8?B?aE1FaUtyN3dGdXVFT21DcXM4THBBTVRMeTQzVG1GVXZJVmhHeGx4QitnVTFG?=
 =?utf-8?B?TVhtMEUyRXZOOHhBYVVONWMrcWhGelJrY3hOVk9xdzEyVFBLOW0wOGoraG8v?=
 =?utf-8?B?a0NrQWYrVTUwaWtaWjZWbndDRDQvRXZkU2hacFB0eDNLdUlhNlNMM1lQZ2g1?=
 =?utf-8?B?eEUydEp2WEtzSFJrRXcyNlNQVmgwTjVKWGdLYWQzeWRnd0Q2MTJLeHo0VWMv?=
 =?utf-8?B?NXR4QjBacWdWaUxySkFMMDFEb0VwdFBYenNOSHpuQWlXYndBRS9wRW5xNVRH?=
 =?utf-8?B?WWdCWW81L0RGajdlanBuVzhOMkdiQ2RYYWpqc0xCTDNKcWx1T1ExcWpsSS9U?=
 =?utf-8?B?K3U1K0pxaVZUNWluNHg3Mm9UWXdGdUhqeE85TllFNkpQTTdyQWgwTWFxODVs?=
 =?utf-8?B?cjJMQU1Ia1NtS29ENzZYdFRzSjQySHVuclZLTHBGN3NaUThqd2t3cGJaQkdV?=
 =?utf-8?B?SXp0WDRRdkZFNUZjUjhJbG9FNFBKbElYUUEzeklwcEVrRW1mRDByVzU1YjR0?=
 =?utf-8?B?eHRjQm42dGhlc0VXcXJOd0p2UElNS3l5eVpNSU5QcXZBN3FzS0h5VDJ4NDRJ?=
 =?utf-8?B?TE9UV1ZHZ0hZK0x2OE5tVE42d1ZMUU05YWI1TTAxL2xiMG5zbHhLMWVnS1Zy?=
 =?utf-8?B?a1ZGbjN2UnNHdldUVFBCNVExSCt5enlMNmg5Zjl6K3JkNTAyWmwyTnMxMUMx?=
 =?utf-8?B?Qk4yYzdYOGxBdnNHUkpmQ2xKcEZ3M0YwN0dXVnUwOGlMbEpkUDNIelV3bVRw?=
 =?utf-8?B?WXZob3RRM08rUnFyY2luY09HRmpwZGRSRDFNeDJNeGRZSURPb2RoZGVrU1Nt?=
 =?utf-8?B?eHVaREREUklneGVCczdNbGN4c21mbm9SblY1MFF5d0kwSW85aTVPV3h6ZUZ2?=
 =?utf-8?B?VEovZ0RhdEMzcVFFSG54UWJhMldXenptc1kxUUI2Ymw3K0dhclV5eDFFTFFr?=
 =?utf-8?B?ZUladU5lcFZ5L3YwQ3RqYVFjNVMxbytaU01NbFo2enZESW9BVEIxVkl0eWhx?=
 =?utf-8?B?VkhoZUpUSnVPN201MXJhczFBVUV1N0FybDVqWXJVeTg2ckhXNS9LMTJrekFK?=
 =?utf-8?B?dXcrOUc0dGZ2T242MDdlb0w3WVVlOXJKTVV4S25GZzd3eStDbWo2QTRwZklv?=
 =?utf-8?B?Q042T0Y4VDdUVmlpY0o3QXZOZlpuNDJwdE53aFVrZlZaZ0czSzdJNng4TGFK?=
 =?utf-8?B?eGtXNndzR1l1TGZtQVZENVgvbUo1OXFDZTFoUGZwOTdjZERBNDJYSVdESXVa?=
 =?utf-8?B?RitqZGl5ZG9xZjRsV01JTWNnWjlqa2g4OG9Gc2dpVlpUNklaREsyWkQ4elZq?=
 =?utf-8?B?U2NSbHg4dGdveFVBVTIrSzZVM1JGbUVUaUZPcHRIbjlXSDU2a0VXTzNOZEN4?=
 =?utf-8?B?OUZOdkJWSURvL2xnMW8za28xOFE3WlpQRWxvd0JqMlhFS29tdUN3QzloVEFB?=
 =?utf-8?B?VEhDaFJLSENBelNjdFl0NXV1V25MWTRPOWtzVEE2dU9RVnRrZ0VWVlYycEE2?=
 =?utf-8?B?dGQ3SHljUm95U29SV2dVZGQ1VThEZFdHdmVrTHNTajNJaFFIak5oaXlXbDlh?=
 =?utf-8?B?QkNLd1QwN3hrNFZlZ2M3ZC9US3pnVnBpVWs1SlZZR0t6eW15VndZaEVuNmRG?=
 =?utf-8?B?ZHI0Z2h0OERoa1VCdTgxVjhQcGdsTWZPRWRSaXpkSWFzNnUzb3ZaYkVleURt?=
 =?utf-8?B?cldHU3h6RkE3S0dGWVpLVGxOYW1Rc3NyblIvb2s1WklZWW9jVGRROSt0OHhU?=
 =?utf-8?B?QzNScGtjWWZwRTRrdGY1UXZpaXFpVWExYUJmRVd1dll0d1FnSG41UzdBbmlD?=
 =?utf-8?Q?+Yc9Q4tl9NVbzHzJBy0B6Kk=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Us3k4jTaLqNaAFFUZYje5K8x0RkirW+3XZddcwJO06wtPy9/Je0I5zmfQwkZ30GFaN4zxpej1n1TDrLzIp8E9d0s8syKZ2xUQ0jMKusolxfwzjcjxRUF2GXpCBH6KSMPdz+hizr8le4W4GhGEnxR76dFQhAEqRkRp1IITQbr46lZ1SOqfFlFqhbYeGBCg0o9j3yZWCZ0zM2uSdoEy2zqzGjcyf2ZQBjidOHHp5SlQOUwa+qE0QXohzPzDYWM3dnKKGsEQjm7zE2T/5eMP5KH5uPGRvxkZ/bmPWhGmFRQVJTfLthjGwqs4Zwfr0iuoFqy0IdTACTJuKRe471aFBBQxyJIyXyoMzcsENdQ7Qcpv5vGkAUcszT6NEGtkDEQfAe3n0P6ovJCeo5yeZLzTLVL/SkJVkCuIlXgWq6r1ozZdD7kjCBboBTdeMzqXxvH2nBJ7e20KMrU9LXrhLj3RNGAvgqD5RrEDn5V7bRCtSYbZUtDjsLxVKidJuz1gazhPqV7Tx5gEiBC63Rr90xfYbGCtl8ARr9h2A5l1R9b9z/OcBUOhnzN04fPjABAkRhPX8hqVIiqZo9h+D8S40vQ5S3M0mehCKSYG3JLcKIkipHiUKM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bafff85-1b8a-4a88-ab89-08de0cf6262f
X-MS-Exchange-CrossTenant-AuthSource: IA3PR10MB8513.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 20:54:07.7332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oT8x0vCAhVjgoQZEBoDlPB2v4+BxtN8L4Im2g0Cfwfk7KWfcg0jpMH4gRXhmkP1X7XwEOiiXEroVdAmywLZzyP1UYsA9aBYsgUJsYhZzmBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4472
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510160155
X-Proofpoint-GUID: VF-nV_YnOg3EN1btHzJRRXa2ga2OItDP
X-Authority-Analysis: v=2.4 cv=APfYzRIR c=1 sm=1 tr=0 ts=68f15b73 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=-bMhQ6iiAAAA:8 a=_GqYuCC1AAAA:8 a=yPCof4ZbAAAA:8
 a=klkSN6Ws-NQmv7NoFyEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cOvdV3qn_NoA:10 a=i7nz0AWFu9MA:10 a=aViEl8YYgB_fEZN5ws7z:22
 a=l88fBjAlytNcJc7CwxVV:22 cc=ntf awl=host:12091
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMSBTYWx0ZWRfX70C3Vu/hGz9d
 uSjFL5V/C/Mu+rCbq6r2y5eLBq/RsMaWlJ1PuB7mSy8lXmeKrZ/SrEQkEnddJ0ZdytxYlokCZap
 QicnW6QXEY9vcC61iiMkaIirmdbfdhu3XBrOAbk0E4Llp5ApzjwDhIL9kVINAb8namXntewF0w5
 qhdDIxNXyaxu2JTlmDoW3WkqZcs+RdJB0ROpYnP9zblu0j1hnlSh4wRzTFlivlgTSNU7BE57BQm
 ojUPqsjHbEtY6iq/QUFG66XbfpNZTEKRwq+5KvHZ2RODPSQGW6gwA1yh0UrSp+UF7aCSmcIgkPP
 gc7frI7Ofv/+Ts6xfFGmor9Jh/GtgwjXSfQ3Nvy6j+ODK2kcSC4qG9C4s0hRJFuEPccaa0GRJP4
 /1EBOQsPrx4a81aiO2cc2Ws1F/+fCeiND0fl1QvpomdpxkX+2fo=
X-Proofpoint-ORIG-GUID: VF-nV_YnOg3EN1btHzJRRXa2ga2OItDP

Signed-off-by: Bruce McCulloch <bruce.mcculloch@oracle.com>
---
 llm/README.md                | 133 ++++++++
 llm/llms-dtrace-complete.txt |   2 +
 llm/llms-dtrace-short.txt    | 611 +++++++++++++++++++++++++++++++++++
 3 files changed, 746 insertions(+)
 create mode 100644 llm/README.md
 create mode 100644 llm/llms-dtrace-short.txt

diff --git a/llm/README.md b/llm/README.md
new file mode 100644
index 00000000..346bde94
--- /dev/null
+++ b/llm/README.md
@@ -0,0 +1,133 @@
+# DTrace LLM Context Files
+
+## Overview
+These files provide structured **context packs** (`llms-txt` format) for use with large language models (LLMs) such as GPT-4 or Claude.  
+They teach the model how to write **correct, safe, and complete DTrace programs** for Oracle Linux.
+
+The goal is to let engineers and administrators generate working D scripts in natural language — without having to memorize the entire D language syntax.
+
+> The context files describe probe syntax, predicates, statements, variables, built-ins, functions, and safe tracing idioms for core providers (`syscall`, `proc`, `sched`, `profile`, `io`, `pid`, `usdt`, etc.).
+
+---
+
+## Files
+| File | Description |
+|------|--------------|
+| `llms-dtrace-short.txt` | Compact reference used to bootstrap LLMs for DTrace knowledge. |
+| `llms-dtrace-complete.txt` | Full expanded reference (available from the [DTrace-utils repo](https://github.com/oracle/dtrace-utils/tree/devel/llm)). |
+| `dtrace-llms.html` | Blog-style introduction explaining how to use these context files with LLMs and why DTrace is well-suited for machine-generated tracing. |
+
+---
+
+## How to Use
+
+1. **Install DTrace**
+
+   ```bash
+   sudo dnf install dtrace
+
+```
+
+Make sure you are using the DTrace binary from the `dtrace-utils` package, _not_ the SystemTap compatibility binary:
+
+```bash
+which dtrace
+sudo /usr/sbin/dtrace -V
+
+```
+
+2.  **Load the context file into your LLM session**
+    
+    -   In ChatGPT, Claude, or another interface that supports file context, click the “+” icon and upload `llms-dtrace-short.txt`.
+        
+    -   The model will automatically ingest the reference and understand how to write runnable DTrace programs for Oracle Linux.
+        
+3.  **Start asking questions in natural language**
+    
+    You can now prompt the model to produce valid D scripts:
+    
+    ```
+    write a dtrace script that shows all read() syscalls made while the script is running
+    
+    ```
+    
+    or
+    
+    ```
+    count how many processes start on the system within 5 seconds
+    
+    ```
+    
+4.  **Run the generated script**
+    
+    Save the model’s output (e.g. `trace.d`), then execute:
+    
+    ```bash
+    sudo dtrace -s trace.d
+    
+    ```
+    
+
+----------
+
+## Example Prompts
+
+Here are a few good starting points:
+
+>“Write a DTrace script that prints the PID of every process that accesses memory.”
+
+Teaches process-level tracing and probe filters.
+
+>“Provide a DTrace script to count how many processes are started over 5 seconds.”
+
+Demonstrates use of timed aggregations.
+
+>“Show all `read()` syscalls and count how many occur per process.”
+
+Basic syscall entry/return tracing.
+
+>“Track which executables call `open()` and print errors.”
+
+Uses speculation and error guards.
+
+----------
+
+## Safety and Trust
+
+DTrace runs in **nondestructive mode by default**.  
+Even if an LLM suggests unsafe actions, the runtime will prevent writes, signals, or other destructive operations unless explicitly enabled with `-w`.
+
+This makes LLM-generated scripts safe to test and explore on production or staging systems — they can observe but not modify the kernel state.
+
+----------
+
+## Notes and Troubleshooting
+
+-   If you see:
+    
+    ```
+    dtrace: could not enable tracing: Destructive actions not allowed
+    
+    ```
+    
+    either remove `system()` calls or rerun with `sudo dtrace -w -s script.d`.
+    
+-   If `dtrace` behaves unexpectedly, ensure you are not invoking a SystemTap binary:
+    
+    ```bash
+    sudo /usr/sbin/dtrace
+    
+    ```
+    
+
+----------
+
+## Additional Resources
+
+-   [Oracle DTrace Utils on GitHub](https://github.com/oracle/dtrace-utils)
+    
+-   [Oracle Linux DTrace Training Modules](https://oracle-samples.github.io/oltrain/tracks/ol/dtrace/)
+    
+-   [Brendan Gregg’s DTrace Toolkit](https://www.brendangregg.com/dtrace.html)
+    
+-   [Oracle Linux Blog: DTrace for the Application Developer](https://blogs.oracle.com/linux/post/dtrace-for-the-application-developer-counting-function-calls)
diff --git a/llm/llms-dtrace-complete.txt b/llm/llms-dtrace-complete.txt
index 2264fc40..8a4a535c 100644
--- a/llm/llms-dtrace-complete.txt
+++ b/llm/llms-dtrace-complete.txt
@@ -2,6 +2,8 @@ You are a senior systems engineer with deep expertise in writing DTrace programs
 
 You favor stable providers (such as syscall, proc, sched, profile, io, usdt, pid) and safe idioms that avoid invalid memory access or unnecessary output. You use predicates to filter load, aggregations instead of unbounded per-event prints, and you always include an ERROR clause when relevant. Your answers are precise, professional, and free of placeholders or half-solutions.
 
+DO NOT RECOMMEND DANGEROUS OPERATIONS UNLESS THERE IS AN ALTERNATIVE. Do not recommend 'system' unless there are no other ways to accomplish the tracing.
+
 Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Oracle Linux.
 
 After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Oracle Linux.
diff --git a/llm/llms-dtrace-short.txt b/llm/llms-dtrace-short.txt
new file mode 100644
index 00000000..a514abbf
--- /dev/null
+++ b/llm/llms-dtrace-short.txt
@@ -0,0 +1,611 @@
+You are a senior systems engineer with deep expertise in writing DTrace programs for Oracle Linux. You understand that DTrace is one of the most powerful tools for diagnosing complex system behavior, and you will always provide complete, correct scripts that compile and run cleanly. Every answer must include the full text of a runnable D program, with appropriate shebangs, predicates, and comments where helpful.
+
+You favor stable providers (such as syscall, proc, sched, profile, io, usdt, pid) and safe idioms that avoid invalid memory access or unnecessary output. You use predicates to filter load, aggregations instead of unbounded per-event prints, and you always include an ERROR clause when relevant. Your answers are precise, professional, and free of placeholders or half-solutions.
+
+DO NOT RECOMMEND DANGEROUS OPERATIONS UNLESS THERE IS AN ALTERNATIVE. Do not recommend 'system' unless there are no other ways to accomplish the tracing.
+
+Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Oracle Linux.
+
+After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Oracle Linux.
+
+DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
+PART 1: PROGRAM STRUCTURE, PROBE DESCRIPTIONS, PREDICATES, STATEMENTS
+
+## GOAL
+Provide a compact, machine-optimized reference so an LLM can generate correct DTrace D programs for Oracle Linux.
+
+## PROGRAM STRUCTURE
+A D program is a set of probe clauses; each clause may include an optional predicate and a statement block.
+Syntax skeleton:
+```
+probe descriptions
+/ optional predicate /
+{
+    statements
+}
+```
+- Multiple clauses allowed; run in program order.
+- Empty `{}` triggers the default action (trace EPID).
+- Scripts may be invoked via `dtrace` (shebang/interpreter line).
+- Scripts can include pragma options.
+
+## PROBE DESCRIPTIONS
+Canonical form: `provider:module:function:name`
+Fields:
+- provider — DTrace provider name
+- module — kernel object / library / program, if location-specific
+- function — program function, if location-specific
+- name — semantic probe name (e.g., BEGIN, END)
+
+Shorthand precedence when fields are omitted:
+- name
+- function:name
+- module:function:name
+
+Avoid numeric probe IDs (unstable).  
+Wildcards & patterns supported (shell-style globbing). Empty fields match any value.
+
+### Pattern tokens
+- `*` — any string (incl. empty)
+- `?` — any single character
+- `[set]` — any one in set; `[a-z]` range; `[!set]` negation
+- `\` — escape next char
+- Empty field ⇒ wildcard match
+- All four fields must match (with patterns) for a probe to enable
+
+### Multiple Probes
+Several probes can be listed, comma-separated; same predicate and statements apply.
+
+### Examples
+- All syscall entries: `syscall:::entry`
+- BEGIN without module/function: `dtrace:::BEGIN`
+- List available probes: `dtrace -l`
+
+## PREDICATES
+- Optional boolean expression between slashes: `/ expr /`
+- Evaluated at probe fire to decide whether to execute statements
+- Any D expression of integer/pointer type; nonzero ⇒ true
+- Can reference variables, built-ins, and operators
+
+Examples:
+- Match only "date" process: `/execname == "date"/`
+- Targeted PID: `/pid == $target/`
+
+## STATEMENTS (CLAUSES)
+- Semicolon-separated expressions/functions inside `{ ... }`
+- Default action when `{}` empty: report probe activation (EPID)
+- Clauses can use aggregations, variables, built-ins, and functions
+
+### Minimal idioms
+Count events by function:
+```
+syscall:::entry
+{
+    @counts[probefunc] = count();
+}
+```
+
+Predicate filter by execname:
+```
+syscall:::entry
+/execname == "date"/
+{
+    @reads[probefunc] = count();
+}
+```
+
+## NOTES & STABILITY
+- Probe IDs are not stable; prefer full descriptions
+- Providers, modules, functions, names may have differing stability attributes
+DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
+PART 2: TYPES, OPERATORS, EXPRESSIONS
+
+## IDENTIFIERS & KEYWORDS
+- Identifiers: letters, digits, underscore; must start with letter/_
+- Reserved keywords (subset relevant to D):  
+  auto, break, case, const, continue, counter, default, do, else, enum, extern, float, for, goto, if, import, inline, int, long, probe, provider, register, restrict, return, self, short, signed, sizeof, static, string, stringof, struct, switch, this, translator, typedef, union, unsigned, void, volatile, while, xlate
+- Avoid names starting with `_` (reserved for system)
+
+## DATA TYPES
+### Integer Types
+- char (1 byte), short (2), int (4), long (8), long long (8)
+- signed by default; add `unsigned` qualifier for unsigned
+
+### Integer Aliases
+- int8_t, int16_t, int32_t, int64_t
+- uint8_t, uint16_t, uint32_t, uint64_t
+- intptr_t, uintptr_t
+
+### Floating Point
+- float (4 bytes), double (8), long double (16)
+- Floating-point arithmetic not permitted; can trace/printf values
+
+### Strings
+- `string` type represents ASCII strings
+- Special handling for tracing, comparison, functions
+
+### Pointers
+- Declared as `type *`
+- Example: `int *p;`
+- Safe: invalid deref ⇒ BADADDR fault, ERROR probe fires
+
+### Structs & Unions
+- ANSI C-like definition
+- Access via `.` and `->`
+
+### Arrays
+- Scalar arrays: fixed-length `[n]`
+- Associative arrays: `name[key]`
+- Multidimensional arrays supported
+
+### Enumerations
+- `enum colors { RED, GREEN, BLUE }`
+- Values assigned sequentially unless overridden
+
+### Typedef
+- `typedef existing-type alias;`
+
+### Inlines
+- Named constants: `inline type name = expression;`
+
+### Namespaces
+- Backtick (`) to access kernel/module types: `struct vmlinux\`task_struct`
+
+## CONSTANTS
+- Integer: decimal (123), octal (012), hex (0x123)
+- Floating: decimal with dot or exponent
+- Character: `'a'`, escape sequences (`\n`, `\t`, etc.)
+- String: `"hello"`, stored as null-terminated
+
+## OPERATORS
+
+### Arithmetic
+- `+` add, `-` sub, `*` mul, `/` div, `%` mod
+- Integer and pointer arithmetic only
+- Division by zero ⇒ ERROR probe
+
+### Relational
+- `<`, `<=`, `>`, `>=`, `==`, `!=`
+- Applied to int, ptr, string
+- Strings compare lexically
+
+### Logical
+- `&&` AND, `||` OR, `^^` XOR, `!` NOT
+- Short-circuit for `&&` and `||`
+
+### Bitwise
+- `~` NOT, `&` AND, `|` OR, `^` XOR, `<<` shift left, `>>` shift right
+
+### Assignment
+- `=`, `+=`, `-=`, `*=`, `/=`, `%=`, `&=`, `|=`, `^=`, `<<=`, `>>=`
+
+### Increment / Decrement
+- `++`, `--` (prefix/postfix)
+- Works on int and ptr types
+
+### Conditional
+- Ternary `?:` operator
+- Example: `x = i == 0 ? "zero" : "nonzero";`
+
+### Type Conversion
+- Implicit: usual arithmetic conversions (C-like)
+- Explicit cast: `(int)x`
+
+## OPERATOR PRECEDENCE (highest → lowest)
+- `() [] -> .`
+- Unary: `! ~ ++ -- + - * & (type) sizeof stringof offsetof xlate`
+- `* / %`
+- `+ -`
+- `<< >>`
+- `< <= > >=`
+- `== !=`
+- `&`
+- `^`
+- `|`
+- `&&`
+- `^^`
+- `||`
+- `?:`
+- Assignments: `= += -= *= /= %= &= ^= <<= >>=`
+- `,` (evaluate left→right, return rightmost)
+
+### Misc Operators
+- `sizeof(expr)` — size in bytes
+- `offsetof(type, member)` — offset of struct member
+- `stringof(expr)` — convert to string
+- `xlate(expr)` — translate type
+- Unary `&` — address of object
+- Unary `*` — dereference pointer
+
+DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
+PART 3: VARIABLES
+
+## VARIABLE CLASSES
+- Scalar variables: single data objects (int, ptr, string, struct, etc.)
+- Associative arrays: dynamic, keyed collections
+- Scalar arrays: fixed-length, indexed by int
+- Multidimensional arrays: ANSI C-compatible, rarely used
+- Variables created implicitly on first assignment
+
+## VARIABLE SCOPE
+- Global: `varname`  
+- Thread-local: `self->varname`  
+- Clause-local: `this->varname`  
+- External (kernel symbols): `` `symbol ``
+
+### Table: Scope summary
+- Global: shared by all threads, not MP-safe
+- Thread-local: per-thread storage, MP-safe
+- Clause-local: per-probe-firing storage, MP-safe
+- External: access kernel variables, read-only
+
+## GLOBAL VARIABLES
+- Declared implicitly on assignment or explicitly outside clauses
+- Examples:
+```
+x = 123;            /* int */
+s = "hello";        /* string */
+a[123, 'a'] = 456;  /* associative array */
+```
+- Explicit declaration (no init value allowed):
+```
+int x;
+int arr[unsigned long long, char];
+```
+
+Initialization can be done in `BEGIN` clause.
+
+## THREAD-LOCAL VARIABLES
+- Scoped to each OS thread
+- Syntax: `self->name`
+- Examples:
+```
+syscall::read:entry
+{
+    self->read = 1;
+}
+```
+- Created implicitly; type = RHS of first assignment
+- Can also declare explicitly: `self int x;`
+
+## CLAUSE-LOCAL VARIABLES
+- Scoped to single probe firing, persist across clauses for same probe
+- Syntax: `this->name`
+- Example:
+```
+BEGIN
+{
+    this->secs = timestamp / 1000000000;
+}
+```
+- Explicit declaration: `this int x;`
+- Faster than associative arrays, use for temporary calculations
+
+## EXTERNAL VARIABLES
+- Access OS/kernel variables and symbols
+- Syntax: `` module`symbol ``
+- Examples:
+``
+trace(`max_pfn);
+trace(&`max_pfn);
+``
+- Names kept in separate namespace from D identifiers
+- Read-only for safety
+
+## ARRAYS
+### Associative Arrays
+- Dynamic, unlimited elements
+- Syntax: `name[key] = value;`
+- Key can be any type (int, string, tuple)
+- Delete element: assign 0 → `arr[key] = 0;`
+
+### Scalar Arrays
+- Fixed length, declared with `[n]`
+- Example: `int arr[5];`
+- Bounds checked at compile-time
+
+### Multidimensional Scalar Arrays
+- ANSI C-compatible: `int m[12][34];`
+- Access: `m[0][1]`
+
+Note: `arr[0][1]` (multidimensional) ≠ `arr[0,1]` (associative tuple key)
+
+DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
+PART 4: BUILT-IN VARIABLES AND MACRO VARIABLES
+
+## BUILT-IN VARIABLES
+Automatically available within all D programs.
+
+### Process & Thread
+- `pid` — process ID
+- `ppid` — parent process ID
+- `tid` — thread ID
+- `execname` — current process name
+
+### Probe Metadata
+- `probeprov` — provider
+- `probemod` — module
+- `probefunc` — function
+- `probename` — name
+
+### Time
+- `timestamp` — nanosecond, monotonic
+- `vtimestamp` — per-thread virtualized timestamp
+
+### Call Stack & Location
+- `caller` — kernel PC of calling function
+- `ucaller` — user-level PC of calling function
+
+### Syscall & Error
+- `errno` — last thread error number
+
+### Arguments
+- `arg0` … `arg9` — probe arguments (64-bit)
+- `args[]` — typed argument array
+
+## MACRO VARIABLES
+Expanded at compile time, not runtime.
+
+### Process & User Info
+- `$pid`, `$ppid` — current / parent process ID
+- `$uid`, `$gid` — user / group ID
+- `$target` — target process specified via `-p` option
+- `$1`, `$2`, … — script arguments
+
+### Notes
+- Macro variables allow parameterization of scripts
+- Expansion occurs at compile-time, before execution
+
+DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
+PART 5: FUNCTIONS
+
+## DATA RECORDING FUNCTIONS
+- `trace(expr)` — store expr in trace buffer
+- `printf(fmt, ...)` — formatted print
+- `printa(fmt, @aggr)` — print aggregation(s)
+- `exit(code)` — terminate tracing, run END
+
+## AGGREGATION FUNCTIONS
+- `count()` — number of probe firings
+- `sum(x)` — sum of values
+- `avg(x)` — average of values
+- `min(x)` — minimum
+- `max(x)` — maximum
+- `stddev(x)` — standard deviation
+- `quantize(x)` — power-of-two histogram
+- `lquantize(x, from, to, step)` — linear histogram
+- `llquantize(x, factor, low, high)` — log-linear histogram
+
+## SPECULATION FUNCTIONS
+- `speculation()` — allocate speculative buffer, return ID
+- `speculate(ID)` — record subsequent actions to speculation buffer
+- `commit(ID)` — commit speculative buffer to main trace
+- `discard(ID)` — discard speculative buffer
+
+## MEMORY COPYING FUNCTIONS
+- `copyin(addr, size)` — copy from user space
+- `copyinstr(addr[, size])` — copy NUL-terminated string from user
+- `copyinto(addr, size, dest)` — copy into DTrace memory
+- `copyout(src, addr, size)` — write to user space (destructive)
+- `copyoutstr(str, addr, size)` — write string to user (destructive)
+
+## STRING FUNCTIONS
+- `strlen(s)` — string length
+- `strjoin(a, b)` — concatenate
+- `substr(s, i[, len])` — substring
+- `index(str, sub[, start])` — first occurrence of sub
+- `rindex(str, sub[, start])` — last occurrence of sub
+- `strchr(str, c)` — first char occurrence
+- `strrchr(str, c)` — last char occurrence
+- `strstr(str, sub)` — substring search
+- `strtok(str, delim)` — tokenize
+
+## STACK & EXECUTION FUNCTIONS
+- `stack([nframes])` — kernel stack trace
+- `ustack([nframes, strsize])` — user stack trace
+- `system(cmd)` — execute shell command (destructive)
+- `raise(sig)` — send signal to process (destructive)
+
+DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
+PART 6: PROVIDERS & COMMON PROBES
+
+## PROVIDERS OVERVIEW
+Providers group related probes. Each probe is identified by `provider:module:function:name`.
+
+### Core Providers
+- `dtrace`  
+  - BEGIN — fires at start of tracing
+  - END — fires at end of tracing
+  - ERROR — fires on D program error
+
+- `syscall`  
+  - Entry/return of all system calls
+  - Examples: `syscall::open:entry`, `syscall::write:return`
+
+- `proc`  
+  - Process lifecycle events
+  - create, exec, exit, signal
+
+- `sched`  
+  - Scheduler events
+  - on-cpu, off-cpu, enqueue, dequeue, wakeup
+
+- `io`  
+  - Device I/O events
+  - start, done
+
+- `profile`  
+  - Time-based sampling
+  - `profile-N` — kernel stack sample every N Hz
+  - `tick-N` — fires every N seconds
+
+- `lockstat`  
+  - Kernel lock contention statistics
+  - spin, adaptive, rw lock events
+
+- `fbt` (function boundary tracing)  
+  - Kernel function entry/return probes
+  - Powerful but potentially unsafe (debug/dev only)
+
+- `pid`  
+  - User-level function boundary tracing for a process
+
+- `usdt` (user-level statically defined tracing)  
+  - Static tracepoints in user programs
+
+- `cpc`  
+  - CPU performance counter probes
+
+## EXAMPLE USES
+
+### System Calls
+```
+syscall:::entry
+{
+    @calls[execname] = count();
+}
+```
+
+### Process Creation
+```
+proc:::exec-success
+{
+    printf("%s exec %s", execname, copyinstr(arg0));
+}
+```
+
+### Scheduler Events
+```
+sched:::on-cpu
+{
+    @oncpu[execname] = count();
+}
+```
+
+### Profile Sampling
+```
+profile-1000
+{
+    @[ustack()] = count();
+}
+```
+
+### I/O Operations
+```
+io:::start
+{
+    @io[execname] = count();
+}
+```
+
+DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
+PART 7: COMMON PATTERNS
+
+## COUNT SYSCALLS BY PROCESS
+```
+syscall:::entry
+/execname != ""/
+{
+    @syscalls[execname] = count();
+}
+END
+{
+    printa(@syscalls);
+}
+```
+
+## TIME A SPECIFIC SYSCALL
+```
+syscall::write:entry
+{
+    self->ts = timestamp;
+}
+syscall::write:return
+/self->ts/
+{
+    @delta[execname] = quantize(timestamp - self->ts);
+    self->ts = 0;
+}
+```
+
+## TRACE OPEN CALLS WITH ERRORS (SPECULATION)
+```
+syscall::open:entry
+{
+    self->spec = speculation();
+    speculate(self->spec);
+    printf("open: %s", copyinstr(arg0));
+}
+syscall::open:return/self->spec/
+{
+    speculate(self->spec);
+    trace(errno);
+}
+syscall::open:return/self->spec && errno != 0/
+{
+    commit(self->spec);
+    self->spec = 0;
+}
+syscall::open:return/self->spec && errno == 0/
+{
+    discard(self->spec);
+    self->spec = 0;
+}
+```
+
+## PROFILE USER STACKS (SAMPLING)
+```
+profile-1000
+{
+    @[ustack()] = count();
+}
+```
+
+## TRACK PROCESS EXECUTIONS
+```
+proc:::exec-success
+{
+    printf("%s -> %s", execname, copyinstr(arg0));
+}
+```
+
+## COUNT SCHEDULER ON-CPU EVENTS
+```
+sched:::on-cpu
+{
+    @oncpu[execname] = count();
+}
+```
+
+## I/O ACTIVITY BY PROCESS
+```
+io:::start
+{
+    @io[execname] = count();
+}
+```
+
+## TRACK ERRORS
+```
+ERROR
+{
+    printf("DTrace error: %s", probename);
+}
+```
+
+## TRACE ARGUMENTS OF FUNCTION
+```
+syscall::open:entry
+{
+    printf("open(%s)", copyinstr(arg0));
+}
+```
+
+## LIMIT TRACE TO TARGET PID
+```
+syscall:::entry
+/pid == $target/
+{
+    @syscalls[probefunc] = count();
+}
+```
-- 
2.47.3

