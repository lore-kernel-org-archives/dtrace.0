Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D511208AD
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747937213; cv=fail; b=glB0DXzOJIb1veVwZ5LN/zTeIh9lkjUtmJ1NH/7pC5B3vwZiyArweyvBFnc9FMjiaQC3XjBvDTftOR1mVY4+L5zrbyHBkwTwtSJk3/HofEnDtqCW9tvzRqJEJ/sRNsb1TYmGdeMu7SiW1P7tDv6UwX0T7uQ2Fmezyn8g5PoreFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747937213; c=relaxed/simple;
	bh=f1dB9LpzTYoTLp9hqcaw3hmwctUOv4zhfFiOF47+E0U=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BXP6d8zIRaXDfEr1cQVktW1moba2gEinOirdXSUrBWHdXDVjGz6XZYX8MMqYDCMIkxMLTzhfi6AvYsnhhjw+U5JfKhRYpfrWPgB2yW/k+bmoGhuyNgX6O95rR7hMVSs2Jp1rIprklAbpqKT9UQrPI2aITKnjgtmRI52+giRDvMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=F0CTj6vh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AqveW4u7; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="F0CTj6vh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AqveW4u7"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MH0snB014490
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=mN9QV5MtbVHBseFNX9
	2I2x43vunvcA0omtkrJol4hVY=; b=F0CTj6vhjP1BoqAE/mFMZPXhadtxMcopDV
	B8l9eNnmF5PtmdEizTrhWvMZwe0z0gpXdTNESolnEs5+UY0nAKSGi2rJTRoIYCV4
	6VZ7DYjrVf6oic1+ncPUSE/2qWD9LqZWOB9Jgd7+ptebYokIvc02xSJ8vBOZRzhi
	dqVNN8w5jwa3AJ7loFTzSFEMOqcS3fwKlDy6hsA7zUdukbyf0qbRhzNXhXGtWmKb
	Kl7bRg/sPrbSda2tIDbPkt9vmZEqWxv/R52yZVlEnEASZgroOQxpy8I7Gb73FVSb
	z4N2hygApdm/87mnib4YKY3UKJPxssyK07sfXe/D5JNNHPwEqZdw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46t7838b6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:06:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54MGovpF011350
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:44 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11010054.outbound.protection.outlook.com [40.93.198.54])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46rweprwm3-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tam901jQ178DVcvOxF6epIkNiGA9lGZzJU3esaeMs5MwTryIjVY1JdehUKqaJz6tzbnILmIYFWdTO0oaZ6HgVDLM2p7iD32mXmj+qLGYN1tbee9AFE3452JFxjY63TY+VzkNSvBwkmu92tRJkJD8MusL8HZ55zwO0Ih6vq6VyeYebHdpiVNeXgH8U48JO8HCN/kCmZ5vTzCd2+vLmnfPJF0dpo2oMRnqgYYBalQjPofNz31mRMNxpuyaHAm12VmjonH4zQYhUt5Cmlv0QBhu3wSodO2y2KG084k32+EmdUXTHCkRN8IOjFjDEV1BL5GXnYIcQTuiRj1/tszBOayKpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mN9QV5MtbVHBseFNX92I2x43vunvcA0omtkrJol4hVY=;
 b=LNp22zpSFSLp1SWd2oCRzWesGKVtWZ2JRuzZy1R0sj5a7VT50qZPtB02a2Ix3flRzKilwwgTzidfmYj0pWye0t2Ls1h/avFtxRlO8FwGTvaBKxfKt/yqRqiZg65WT2MJ0LLzpzxTP8DUPcJMA48m/tZShaHJLAD8kHfYwKOgEtlm/GiiTT6sXV3sX/d7u7/laEX1y8JAWcB84u4e+SczX2HQGzPYKrY5B1HWF5bbb3xKrktA4ckjaN7qcybWm2hrgKYjJ2ea0iiNupgNFahfRufJBjycLzSkKUTAFNaGGg4ooOfFdw1QR51QuWO8NNVU2gMI+e8I4/hC1AWRi0q1jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mN9QV5MtbVHBseFNX92I2x43vunvcA0omtkrJol4hVY=;
 b=AqveW4u7hYyHEm1yFxXWF5V+Qj0A1kYI1sjtE0YsNvW9WM3YlkaBu42PfXgYYbouXvwEPzcQYjGz8cGpgPr7KUgjGeH3r3b9VURcNVnxTfxmNaAydwmIh0Vcr096mFIO9uVmUPniDysadE2XUHYX+54AihxylrfLyGRvua9lXcU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW6PR10MB7590.namprd10.prod.outlook.com (2603:10b6:303:24c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.32; Thu, 22 May
 2025 18:01:42 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8722.027; Thu, 22 May 2025
 18:01:42 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 07/14] Test: caller and stackdepth tests for cpc provider
Date: Thu, 22 May 2025 14:01:11 -0400
Message-Id: <20250522180118.27343-7-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250522180118.27343-1-eugene.loh@oracle.com>
References: <20250522180118.27343-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0167.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW6PR10MB7590:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a153b57-c2cb-4c16-225a-08dd995ab52e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1iX1tAhyJNG+IxGAt9DxRb8h9CYPbGPDXuRdiDCn+P8n9n3gCGtTuifMvLid?=
 =?us-ascii?Q?vCqi9b7MjHLovnv/PybB83bRSyIpoP+Ln6b332Xlo4QOEoFCmpnoswXgrRPM?=
 =?us-ascii?Q?t+/3YLS5MFZNMZjqzs8KbbQTAz5CRjQAUTS14Q/pNvTtKXQ30gzJWwnagx+E?=
 =?us-ascii?Q?hvkZvRKQx4HbfvJwfOXBtJwQhqvgJGnr4tng9XhJAwBXa2SC72RKJLu0SxFE?=
 =?us-ascii?Q?G+1BAY2mMxxoLOZvMB9YWKAnNa43TA0l56GbyPl6tBpTCAPN//7Ea4Xys2XS?=
 =?us-ascii?Q?snJ5lNhL4V7gXlGlbMaBL9B7rtbYuS9FI+iMFw/K1DnTOZMWZFGKxxLOZWS3?=
 =?us-ascii?Q?LzNdh5GzQZjK5YEC7/ilbXfGh/KPxeeb9B54fKgBClVRyvVq4136eTWqxujV?=
 =?us-ascii?Q?7vnqqL5IZQPCKEJeUsbSvw7WF95R0K1v56wK5jpzzu0qciXHJGLcsJ3TfSA8?=
 =?us-ascii?Q?WotnVl9cr6ZCgeXgJx+P3HEhitzXWTmvKLglA3s0/fN78CVLbJqfhq82pqoQ?=
 =?us-ascii?Q?91EBCmy6mPjpVrpO2SftZJLon3l4ux/kVxfrdyh3y5FR3CueTWA6z1SIps3n?=
 =?us-ascii?Q?9wR0QsC/qNCEhtUvoVQRbjALH66oIW5clWh0Y1it11X8khB4CqXqO2Cefz5y?=
 =?us-ascii?Q?enF2lVyLlDC1EoSN3L3dcNGcVdOGSEn8sAun8w7StScqEEHPWhk7DoAu5Fby?=
 =?us-ascii?Q?3gIttNJ4+fhhhlSH6H0BQszT9WnZi3Mbyt5lUJaahGuQc8p6zgAIwSsPcAn7?=
 =?us-ascii?Q?lwIvPUy2uaQTyMUiIqhWIZayDLnFiDVp8y6nEWMSR4AY8ilM0FkVT1Zza3aH?=
 =?us-ascii?Q?5xMKf/MOSvL3DDzjyWWal7XTG+nrPDwLY0E2cFuA5grXdTwEYvMMrOW9hZx4?=
 =?us-ascii?Q?pNPzhr+f/tiZv9vUvJymhoOgSmExl3+XJka22JgQ1W4m4ucqAC1drv9Ri6na?=
 =?us-ascii?Q?dy/bhx5fyVe5b7gywvHqKQ+AA3nrd/F/40gIrfDk4z860B8UYDAU01rjEl4f?=
 =?us-ascii?Q?cANXdTxXxwScgZMtdQUMIgEB3OfJe39AClu0zjG3ezvyMjInKJ/GSQ5XNg7Y?=
 =?us-ascii?Q?nPH19iGE9lxLAVryCFO0ayMeEb9hPJ1ielCahAnnyjQX2ECzvCuvJa9weuFV?=
 =?us-ascii?Q?C42nsnoMdnbCYSOJ3qY9MIruMn96YrwSjSkuXeNFVp7BvcOySm2m6DQDteLq?=
 =?us-ascii?Q?9iB5c9HN/xfx0D4cIxxQqoUQn6WdQ5Z7SbCiiJZgRcADBJ23aG5g5So/dU+V?=
 =?us-ascii?Q?Lm3oM0xbajqlmwgS4OAkHPD0meYitm+C4hnYIXJnIZ7Zp8NM1NQ4GQtSJBTi?=
 =?us-ascii?Q?JPMG/htJoXf1WqlUGmAKOd/qlEEgxSputykU8wB+Ba8aZE9Ex0eJMbVXVqN9?=
 =?us-ascii?Q?NRqP8V/XDHdHMmDsBubvA5bU/yD6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9Zhmf8+TKToilcvTAh1Vh7U/mM7RLQtB0LzUAxYAKWIF644pcQVQrhlx2Sjc?=
 =?us-ascii?Q?D2L6aQCrhRI5u713WZfMdgkhXMQArbuukI5fE8MztQKx7AKu1MuOfdgj26EI?=
 =?us-ascii?Q?haULFJ/5+BQR45UjCDHRRLyZgftwBRp3ZyTFCyzbLsQ/B1XnlcRxPzUu2G6+?=
 =?us-ascii?Q?eDGNRD5mRWYgH1o5u51RQZvw6RtUhAZCtF1mf5FplCN1MDVsJhvTjc4qSRG6?=
 =?us-ascii?Q?Hk0wRXvY5dz1/CltwoDHv8wiuN7ITk11+eW2aoC3aPGSMGL+1c+bSTBjZHrD?=
 =?us-ascii?Q?JPNo1qAdsWv05ORMQAtK0UkBCvmNI2HbtG3P1jiQirp6fWId1JLQpvpAUFsv?=
 =?us-ascii?Q?3qQ++T+BXopbnD3qaR6TDy2nHKBoFqBdRMBAUeq66Vi6YNJ9vqXY2FLN++EY?=
 =?us-ascii?Q?nKABQCG5Ym7xQ7CJIWEStokgK87Hah/orTIObeFjxpKX7MQKWzHg1J37ukjk?=
 =?us-ascii?Q?B73rPbTS9yz/5q4OO2FUG4jRmdnsIOAZR7ejU4kEuvdaYJz8Y2zpb86angfH?=
 =?us-ascii?Q?8QzUqb82aoq/xv5RqriFD5Oe47Qj8O3afmBfT9Two+/I+/VuRKAVFbAfPnG8?=
 =?us-ascii?Q?BIqCSEKKLAHyOEbt79O5YpqqmEP86REUBMyPlrbU1m5/hAoJYF6fZT8JmddM?=
 =?us-ascii?Q?qUG6UXPyN/ZjK2Y2JKk6gYNYscDqsrT4e0dOmqJ7xPRjE8kLx/bKcYF2v1hU?=
 =?us-ascii?Q?7lmgv75tfXB+QEZ8qp/qEignaFWnBhvKYPAI9CFNk3Ubol96XaOe6fJJrig4?=
 =?us-ascii?Q?lBnI7RIWyjqH2zeGFuS/8Jmz1IZwHrCqNigPY5BfbfPqND+D7zNIkaoCwn2/?=
 =?us-ascii?Q?F+gMWob7cg3qAYNGUtmSwpwxH3qn740Dcpoj+s2zIyut+d7UtVKjYOBxOe1Y?=
 =?us-ascii?Q?5OOFEd7bRo/wQBP02LP7jeTWG+XCl4oJlrYuQNrmhnlqoDJb9wvWQ3fG2pEd?=
 =?us-ascii?Q?LsQ+ZUrlx5Dka61hrClDd2zE1E0pqUbVUr4VZ/X5EoG3dhUX60MnGzsaTkrm?=
 =?us-ascii?Q?e7fA+pnXoVTN2xpoaUbx+wsRK/Rc4j2nQLxbE3F26HAF9mwDpmJN/BsJWtGk?=
 =?us-ascii?Q?caGue6JyRBMRpYpPORROQt9Id7pN5tQO2HrVOCFEOCIBqw9ZBlOfLCPWxuAl?=
 =?us-ascii?Q?XZKxK3KK1OGREisNUZ35qkeMhI3ZkduiJ/uaf2tNStcmm38vd1/6y+/U5T8b?=
 =?us-ascii?Q?aoTtvMHPbnuTtWXNgZotvZ0lPD1ZYl+3yivO8OaSYCtJmJ1U2F1uxPFsk/+n?=
 =?us-ascii?Q?Oyucqmu+azXfoEQUJXlXh1qoOgkTsPF8qTSavDc1sQT6ZWX74GC8lEQoF1Qm?=
 =?us-ascii?Q?39u7eNA/QrhAP+hHggjCZdsuPJ0Jg3oQ8++WNN+kEGufwtOHF8laKo4wdAwZ?=
 =?us-ascii?Q?3GdxYDEQAX7T/zr6DNY6Ccy2jDbRLqMo3PjQxg3VJ6kxNGIjYdD8CMZ0FbLZ?=
 =?us-ascii?Q?BAn0ho6tM7SNDAw9dtxalmF9qFd+BcEQVTTjcBSXNME2bwvEB2AtCD5L8ep9?=
 =?us-ascii?Q?ol9C2M6/OGD7d6A4RyhrSOFQakf0lFl+LoDQi1B4i1GLMOSmJZsASuZmUe4E?=
 =?us-ascii?Q?9GT8tOltxxWsCTj69Lau/YtOxumS1yg8tPWPbhFc?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cnqCpsP8aF2Vi/BrnYWM6GGCR5MRn4oPrDrClqU7GAG97IfsgE71s/e1OpDoBMb2bTihmbBF42gha8msIArIMbP+v6z3vwtnAJEh10PO8Vo8/ZHg/flti6DMqy6FLTQ8b0gfKV0DY5gihpiDemC8g6ik5Z0c4Yco1qhckoBzOTu31HhJ2Qq3A6Sz1ARRDmYfwhXBIS7nOEI/FNUBhHDja7rr2Ys6eH2hZFa0otTsTO4rQsTvjExSeXCC/WDAvzaFjsPU3uz86JGFX7rkGPNGtqN7SbX0LU9l/h7K2vTb3gQWQ4ovuux8NPLT3ezy24wCyimoeOpdLXTY5E7rIcRZJ0QHhvAfIbOc5Bhn66poQahkVUTaI5SHMkY2t4J5NBqCnKiYFGkR/ruG4BQU9aBUQM8Gtv/kcGL4kRrTZqP38W+97ZFTwvt9NKNjhHXgZsGAGR34koZ6HVmQ274RLVSqv7z5YAL5tE/MoUQq/501JdjdNqR1ncbocAlERYk0DowrKNnZDreRhdQKoEndgwxxK8M5sW37Eur7MgngSIGvzdaWtsTfPQ3lFImZ80YkMOMbZrkPubRc+HJ9xJOUX/z9mVmN6269wuev/J7rH5i0Pjw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a153b57-c2cb-4c16-225a-08dd995ab52e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 18:01:42.4511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GR5pAELguudEg2L4npebYzWNNw2lLfGHtJWAkKfVwiLtFwvOYvwV7B52S+TaKJl0B7NxRdHGHRXImGOqYHW5AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7590
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505220181
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE4MyBTYWx0ZWRfX/2o8uc8PZYVw gSNBI3vszvluhBkNXpoAAOQHiVEWGrLzynj0F20AbeEWlqjRAvfb6S2wUUl9egeBodF1XoVkzE6 P8O4GRY1AOHd2psZeVe1zEg/njWjTa9XGiklfwbV0LcfGE60QTkNKDeqEuqZlDhmp9AAzvG7DWM
 fdvhoxnG7cJdoLhxpScHBh4Z4eKufyrQX9Az3EbQidguV9c9vyT8mNz/pEAPZGxVRJf1I6SQ59g L4Vyi6VxqQp/8mU+9PWfyc4Am+JoFVu5kr7XxnKiu296bpwVDurQd5m0TGb6wUDXHVoBgFtj4Yi aH5dQNJQYODGfylSstHrA/QFpjWIW5WDOavUi2nidCq79QVeHmQLYK7PaEcmFEg5HZ8GHXIthyc
 mJV17wyR+r/7MHkKr193zsBvBx9VytabwMGMGKwEopcYsUEFz2LQg9Z5xIaxlbX/V4+uzytj
X-Proofpoint-ORIG-GUID: NZ8yyao2WMKqYIvHjAzDnQqxEjWXAPcY
X-Proofpoint-GUID: NZ8yyao2WMKqYIvHjAzDnQqxEjWXAPcY
X-Authority-Analysis: v=2.4 cv=H9Xbw/Yi c=1 sm=1 tr=0 ts=682f67ba b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=tyH8V26bHf4hJXxgQTgA:9 cc=ntf awl=host:14714

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/variables/bvar/tst.caller-cpc.d | 22 +++++++++++++++++
 test/unittest/variables/bvar/tst.caller-cpc.r |  1 +
 .../variables/bvar/tst.caller-cpc.r.p         |  1 +
 .../variables/bvar/tst.stackdepth-cpc.d       | 24 +++++++++++++++++++
 .../variables/bvar/tst.stackdepth-cpc.r       |  1 +
 .../variables/bvar/tst.stackdepth-cpc.r.p     |  1 +
 6 files changed, 50 insertions(+)
 create mode 100644 test/unittest/variables/bvar/tst.caller-cpc.d
 create mode 100644 test/unittest/variables/bvar/tst.caller-cpc.r
 create mode 120000 test/unittest/variables/bvar/tst.caller-cpc.r.p
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-cpc.d
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-cpc.r
 create mode 120000 test/unittest/variables/bvar/tst.stackdepth-cpc.r.p

diff --git a/test/unittest/variables/bvar/tst.caller-cpc.d b/test/unittest/variables/bvar/tst.caller-cpc.d
new file mode 100644
index 000000000..8932185ee
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-cpc.d
@@ -0,0 +1,22 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D option quiet
+
+cpc:::cpu_clock-all-100000000
+/stackdepth > 1/
+{
+	stack(2);
+	sym(caller);
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.caller-cpc.r b/test/unittest/variables/bvar/tst.caller-cpc.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-cpc.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/variables/bvar/tst.caller-cpc.r.p b/test/unittest/variables/bvar/tst.caller-cpc.r.p
new file mode 120000
index 000000000..954ca96aa
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-cpc.r.p
@@ -0,0 +1 @@
+check_caller_to_stack2.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.stackdepth-cpc.d b/test/unittest/variables/bvar/tst.stackdepth-cpc.d
new file mode 100644
index 000000000..abefee0b0
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-cpc.d
@@ -0,0 +1,24 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D option quiet
+
+cpc:::cpu_clock-all-100000000
+/stackdepth > 1/
+{
+	printf("DEPTH %d\n", stackdepth);
+	printf("TRACE BEGIN\n");
+	stack(100);
+	printf("TRACE END\n");
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.stackdepth-cpc.r b/test/unittest/variables/bvar/tst.stackdepth-cpc.r
new file mode 100644
index 000000000..3bd29b8ed
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-cpc.r
@@ -0,0 +1 @@
+Stack depth OK
diff --git a/test/unittest/variables/bvar/tst.stackdepth-cpc.r.p b/test/unittest/variables/bvar/tst.stackdepth-cpc.r.p
new file mode 120000
index 000000000..e50f12822
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-cpc.r.p
@@ -0,0 +1 @@
+check_stackdepth_to_stack.awk
\ No newline at end of file
-- 
2.43.5

