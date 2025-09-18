Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FF9288C35
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 19:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758223317; cv=fail; b=uSvhZYx1mZIQqqNvHciTJA4ygkSDuuDec0VBhkZk57ikT9gI5/xvZAAxx02fAvHS5uaOSKXaOhofO7B7Ytuymjd+JSBljHkIE+8lcfj5zE4t2uI8+NELBruptWDKQuDiKonYVxenbb1FeGuKCQOW+6dcFjyXz57wycsVGI/l1Zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758223317; c=relaxed/simple;
	bh=PQvQQSAvrguA5F/7eK8P5yWO89PUFP2T95TxEL596P4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XGom/obNnlAMIxJ4Dw0Nn0XwgtydzyaKaTbmX3yB1kYvw4jqlpPn4fv8+I8hgUpxcd8K8stHEge6PDoP10KUtIyuS6wWmTNAZlOe2braMuUAndMkhxaD7dKoQWZWh40SWYOKMGbKKa2rVA876KHmCOYRN5b+Iu+PuVbk0xNuPo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=E7Cg+4q9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=X3frWEFw; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="E7Cg+4q9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="X3frWEFw"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IG2tn3025218
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 19:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=cfg3EUVhrEuDmO3G5XwZujeBy9GXuklnRE9dgUkDW0w=; b=
	E7Cg+4q9tR+UGxggXeGUVWhwBPkZ+d5Suk3dURqL+j3GwtOPw6C0D6ac/iF3C5Jn
	JJ/UUR0/IBpDS4fwx8RFxNlRvTGlsqC255MXls+hKKWVVqEpxfszKqic2qUaxQ1C
	+8AiAnV9EGi6MXVC/QH20SY2xdqLpOj+ok9k4SZzHLjFfVgSQGf+iFdyExB5iT5m
	pJ6azNABppaHvNswIu3dn5dBA/TSkix2TRtGeqiUmV/MQ9zsdqPXeDEL3NWZy1h2
	KOUELM8CQ/9SoMkg8IeoCDAOoRO9QZJ9gkbEVzhXchOEmUv8eDCZCQyG23V9LTHJ
	rZpY02AM3nMwBQqiOu35xA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 497fxb47am-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 19:21:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58IIOlKw036751
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 19:21:52 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012049.outbound.protection.outlook.com [40.107.200.49])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 494y2fma6e-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 19:21:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FETcRHG1AeX9wyofmRsPeDeSKcMk+AxlD4p42WvdNqZc3/KpNx1erjxyHWJ7WauRVfukLtUIs/BCeKlmHiCsG7Kee9aepAfoFthxW8iaXTOlNyUr6ffy2bGf/Re5AuUi2B3D5/E8GS1RQue9R4tDO/cvEn+lFE1Um/Khsyi+aO8PGpeDNmP/xZGizSpsOyI+XLfr1TtxdA9rHVlEREhU4jkHhMjT+PQwy15bE2i7lm159QxTTz91Lalwr8yO0qHFcLDkR1YYJEHIXSWBWZlDoFcUqq4VrUa6mK1apr9cukPwiorbrEonJQdnZOj7Zk18FioORVUvLumWFJSRS1dM+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfg3EUVhrEuDmO3G5XwZujeBy9GXuklnRE9dgUkDW0w=;
 b=Sn9BHCxj2Rd6u2OVUo9DUUlaAnbCfYr+6BsSol+fhST/XWYY4Y51QmauoGL5IgtAfTfA45+3+Qw5rKwCPFG/0o0OLhFO1ZL7wXVJZhxei7Raz3CbdD5OS6dTkpHx88srut+wilwJCr8C3qm+54dG+7hAz1H3WyYk+4mYyCgYIoE+5e7/xEu+3V6hIlu1zGvFl7PLt+CNvtf9Fv64gvlLJTB2xwWWaD/cyoQjQQX28YEb9GKWQ4atJkqnnzx+VUlVbcwQ+kWxWmJaQRaSg1mayDvvH0WSg9Cc+qY3PzLfIOWJvQZtgpwJ0+MnkM19ZNeM0+Ly1oq/0odDpQQ2crwSIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfg3EUVhrEuDmO3G5XwZujeBy9GXuklnRE9dgUkDW0w=;
 b=X3frWEFwXjc86vi2aefSekWyGgQ3EtZUD4RZY7l/chlKLUCgMl6ImUfyXG+6Ge1PBx2GQLKHyqHKIsOxfF+sor2ARsnD2O8egYXOaHw3l318+1kX6qAViW/o4vm9MZXCCcWpMti2EW+sOd0wdXhU0W4tiGnszNedLRhhnYyj8LE=
Received: from CH0PR10MB5081.namprd10.prod.outlook.com (2603:10b6:610:c2::13)
 by CH3PR10MB7233.namprd10.prod.outlook.com (2603:10b6:610:121::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 19:21:50 +0000
Received: from CH0PR10MB5081.namprd10.prod.outlook.com
 ([fe80::9314:fd97:7f80:e07c]) by CH0PR10MB5081.namprd10.prod.outlook.com
 ([fe80::9314:fd97:7f80:e07c%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 19:21:50 +0000
Message-ID: <a3b0b775-2651-4eec-8ae9-88d5e53689c6@oracle.com>
Date: Thu, 18 Sep 2025 13:21:47 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Add examples directory to installed doc directory
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
References: <20250918185554.1754957-1-elena.zannoni@oracle.com>
 <87348jlgje.fsf@esperi.org.uk>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <87348jlgje.fsf@esperi.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY5PR15CA0226.namprd15.prod.outlook.com
 (2603:10b6:930:88::15) To CH0PR10MB5081.namprd10.prod.outlook.com
 (2603:10b6:610:c2::13)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5081:EE_|CH3PR10MB7233:EE_
X-MS-Office365-Filtering-Correlation-Id: a2eff063-2f77-49b4-4077-08ddf6e89d4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VEVPUlhSbHZ1VE9sT1VQZGw2ZmQxVW03dlRTenREaEk1dktvRXdsUVltUnFY?=
 =?utf-8?B?dGZEZ1ExRmRBNXM3emQvc2diNndhWFV3N05UbWJFLzNOcUxDcU9OVUZlZzJu?=
 =?utf-8?B?Z2FydUY2YkwwbDNoQjh4RDBaUzZBY2pqNDh6WUFITTl0RzFaRUpYajVmVHNO?=
 =?utf-8?B?alR0dVlvL2RZcG5ORStUM1J5SzhleTNvSFEvUEJwejBnSDJIN1FvOURuc21J?=
 =?utf-8?B?TWFtczZXQ21QMzRxc2RoclhZTG5IY0hjR0pZTXRvSXJ5T3lvOWFZbHAxTUJx?=
 =?utf-8?B?OTRYeGJWZjBtam0yMEVYSFNINEZseCtWU0NmQ1BOdER3U3l1RSs2UXRVem8z?=
 =?utf-8?B?YWE1TEV3YlljdnlITndvQXk1R1hpaU41bEl5MFY5eTJ4UXVkaWREY2JYc3RQ?=
 =?utf-8?B?Q3pZUnRXRm1uNXV4bXI2UzdtZ0cwa01tYVVKekYxdnRrOFZBVGszaThWdGxC?=
 =?utf-8?B?ajF6OHVvd3pETlUvT2ZycE91RUR5ZDlGSEM2OUtKL0I3bDFtVHM3TEpNKy92?=
 =?utf-8?B?NHdkUjZmZFJ1OE1yRnpvZ1FtRFRScE1WSzV1SEJNd0JHYmJqbGNkc0FRU21a?=
 =?utf-8?B?SjVCdzRkMVdWN2R4Y3BqMnNZbXI0VkQrRWJGNU9nWmdjMEpyaFRWZTFIcC9G?=
 =?utf-8?B?TlVEQXVFS3M2ajJac0d6aWV6cnowL1FzMXowZ3VNNXhEQm1ZOUJjYkJ5SDBr?=
 =?utf-8?B?L2dRWE1wUEZlV09wcS9YNUVzK0xkZkQzaWM5YlZQUmExU0ZGck5jSEd0aVVL?=
 =?utf-8?B?ZHR5d0dOaWdQVnNrdkVTbTRSdFY2cGY2bG02WmVtdlNKUzRGUGFxZTlPcGNu?=
 =?utf-8?B?WDdQNjhZbU1mRkJNcDYzWjZ4WXdSSWZ3STBEVjI4U1l4MktBNkFtMG9PZlpN?=
 =?utf-8?B?N3N4NHhJR1cralhnNVVVMk9FSFc2QS9mVjJUb0V4Mmt6Vm1ESnpUU0tRdStv?=
 =?utf-8?B?TWMrOVVvR0NnOXVwd0hGZVdxTURzaW5IVDZGWmw2QS9CQTg1NHFHU0ZKNFNT?=
 =?utf-8?B?UE12d3BtWUhSZ0pIVHp3YWpRVVpSVzFzV0VXZ0ZSZjJPNHhGSjFIcUpqWTFU?=
 =?utf-8?B?OUFuQ3cyaGRuZjEwTW5PejlLdXNzaWpLZ0ZMdjNNRHd6Tk1GbVJFajJCU2dG?=
 =?utf-8?B?SHpmenhjM2hrbmgzOStoSGw4WHJzZVcySkQ3M0N6ZElnU1h3NU9WcFI3UHFF?=
 =?utf-8?B?UWxrYnB5d3hncnJxVUU0VU9xZ2xBbGR0bkRQblpyV1ZtR3EyWEVrQURHOThH?=
 =?utf-8?B?SGZYVlVoN0w5MTV5dWFUTU5EZ05KSXg4cktENktma1dOSmxuaFovdkhMSkVh?=
 =?utf-8?B?U0pOcWFpUWxTSlU4aDkwK2M5OENHZmxDUUNXdmVUYk8xc2h6Tm9SdnRVZHZS?=
 =?utf-8?B?bDVJcmpxRGM3bmJ1YlJQc2RrQW9ZQmxodXRsZ0d6d1ZrSjAxUUVOL01LUURN?=
 =?utf-8?B?c1F2bHZ3NjBQL2dMa0tmYzZONFNnVWw3aDZ6SzkxTTQ1TS9VVGhNa3FGTUZj?=
 =?utf-8?B?U2hVNVhPYm5kdVJJLzJZRTJpdStDVTBOMFVtdVk1QUtPUGdZWUlvTm9EdEI1?=
 =?utf-8?B?QjB0UjhCZUNMcklPWitwWmhERFArcktVSHV4OFBRYnV0b0R0OTNiZ0ZkU0gw?=
 =?utf-8?B?RC9KcHR2RWl6a3VhZG90Q1lDZ1Jma05TN0hBVHlNQ2NjZVJUUTRNSmREMkNU?=
 =?utf-8?B?WG1XbWpocGwrVUJnSUF0RXY1dFR3bTkwQnZFdVh3bVdsTnVtWUtiMU9YS2JB?=
 =?utf-8?B?c2JnTHVzSGlnZmZLNkY0c0dNelg3VUlPVDk4dlFZTXhPMjhybk9pc09IQjM4?=
 =?utf-8?B?azhxaFJZcXBTc1gxNlhnT1ZJb0Z0d0ZuaWtnVGZQSG1YKzdURUNYaElXVEJo?=
 =?utf-8?B?UWxmWWlldHNkNVBQQ3VjaUtSeEZuNURMRUpGN3RzTXNUbjBLMWxIb1UzeWFD?=
 =?utf-8?Q?JLCqZlDzCDk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5081.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmNmNnB4NG9lbDAxMkVCc05tQlBRdHFzMm9aZzIxdXBTMTVwaUhRbmdvRUlp?=
 =?utf-8?B?dG5QN0JrbFVTQTloUWhXV3MyRjhrUUZIRkxNUzRqeDltSnZpRzBzKzdDcUtL?=
 =?utf-8?B?S0pwTlBqUUNzcUNvdFdxd2U1akxaMlRETjJ4SjhYSnRWb1RwUGp3M1JmK3pU?=
 =?utf-8?B?S3lycUlCdkZuZGpYc1VHdkhrV2hIY0YzN2JMckRRUkpwTHErYTB0cTZTYm1v?=
 =?utf-8?B?ekpBTU5wR2h0UHdIRDBrazMzWjYxZzUyZGdETmdwcVBvZkYvaE1UK3Rzb2h5?=
 =?utf-8?B?YXllNjA0NXF5NHVvRGI5MFIzZERNNU5YbkRITFdtcll2NWczL1dsaUpWalIx?=
 =?utf-8?B?SHRYOVNISkVNL2o0bDlpc1orL2p1R3pRTVBBaWJsVlZtdjNuQWZCSVFteGNG?=
 =?utf-8?B?MC9qeUNYdm8wRXc2N3pmc3p5RjVoMzRsN1h2eUNrNysxbGt1NEk0aTI4OVJw?=
 =?utf-8?B?Ti9yQkZNL29pdmV1THhMVGU5enM5a0Fhdi9uczNVNC8wYldIbVF4S3FnUFVp?=
 =?utf-8?B?ZUo1ZkxmVUdUczdBVEpyVk1wWjM2M0NPazkrcHd0Z3FzOXAwMVEvSGdJQVFQ?=
 =?utf-8?B?SmExMERVaEErZVBnZzZDQUJTNFJZSEFRRk9yR3J5V3QvNW82Zm1KRGVlZzda?=
 =?utf-8?B?MWo2bkh3ajZCdVEvWCtxNlU0cmQ5My9BRXNFN2NmWWdkZG8xcXQ1eGdUT3Yz?=
 =?utf-8?B?Rlh3YUtqYTgyR3JQeWlTNGRzVFdUV294N1lpVmFhK0NGb1lPaEFKdTlPeXY5?=
 =?utf-8?B?c1JueUxncjBKK2t3RU9JSGcrNlR4aW5BT2Y1aEwxMkliVXRrNGFhSG5wSU1y?=
 =?utf-8?B?a1F4alpkYjdLdHRtR1ViZmpGcHhxYnBHK05obkFGMWY5bnRES2JNZUU4OXM2?=
 =?utf-8?B?QW9SaVZoS3hXN2pyNFVmU3RZYjZGcW5OcmJDRHZwbGNIeUlEL3VYSFNIY01M?=
 =?utf-8?B?NUpXN0FCZWs0S1JGSXZyRC9TSk1MMEs5N2VlZE96a0dVRmV4NkpwUm43SzFU?=
 =?utf-8?B?MWlwL00rbU9XKzhsOEtJbjEvbG1tOTZFSENvUWdKckY4QVhFU1NVRmZ2bExh?=
 =?utf-8?B?S1d4OVdodTJOWmdjdHFld1VIVVNqSXhDNjZDSENlMW8yRlc2OXpML0s4cUdD?=
 =?utf-8?B?NFgxa2FxM2JiMzlxNFVQSklmL2d0Z0ZEZmdXUXlGclU1WE1BRWhsbkFrR2ll?=
 =?utf-8?B?UVpkWjNNUURRK0pCVkhRWHhHWEgzcVNraXphSmZkeE5yOEhTOW5zWVZyaEc5?=
 =?utf-8?B?bzl4dzBmNEFSVE9FNkRFWHdkbXRlZ1ZXb1dqYmpJdCsxR1VVZmlkTXRZTXhy?=
 =?utf-8?B?aG9idzFsVFMra1h2c1FwYzk5bk5HdlRPNllIUGREajVqeWhwNEI1bGo4cXRs?=
 =?utf-8?B?S3VDOFFVS3poTEd6S0ZoZHpsMUhQN2J5WDNMb1BFT0x4SUdmN3RLVHhKV3lq?=
 =?utf-8?B?Ync5RnJzMlR2aFg4R3BaY2swd3RDUkNtMXpZMFVYcU1IMm9xbmdCbDhWbTNn?=
 =?utf-8?B?WXZlbDd0V0tjaFNHREhnenRwU3VFRTVITWpwWjJ3QStEOVZZRlFoUi81TzJL?=
 =?utf-8?B?K3hFalpHZnhaTVVkcGxyMFJVYUU2UEZ6YWRkMjFuVURJR2drckVTU0xXMFly?=
 =?utf-8?B?MExteEhzbTZWVmVnZWxtRkg4QzRVdE90MktwRGR3ZkowdjczTzdrQ2xuaXd6?=
 =?utf-8?B?cytycEsvbzRUODlLSTc0UUpjZHNXYTBJaEpCWkxPcFQwL0I1L3pQZ1MrNUsy?=
 =?utf-8?B?NmhHQnl2bHloTGttY0g1TFFMU1czQkJ5Z3IrTmpyVjVHR2JqN0hNUWlPSStl?=
 =?utf-8?B?ZkZGend1S3RDQ0prdVc1Z0xJZDVtSmcvUk9ZWkRtOWZtYklBblNGSXRyRFo2?=
 =?utf-8?B?aS9mbG1PS3JWTW5xcU4vWHFFb1pCcDFaMmRSY1RDU00vdlVTN0F0MFV4Yktz?=
 =?utf-8?B?THZVRzBLSmh3VnZ3Y3ZMclRJbnJrQzllVUZPWGkrMGFBWFdnSTRWL0srLzdo?=
 =?utf-8?B?UURZRmxkMWNIUzBhbmJ1VGZHVm5mL21henRiWTlJVDk5S0FtRGVhYURXNEY1?=
 =?utf-8?B?TjRaKzJxWlhadTc4SW5raWMxSWdFYUNnN1hNRlkyYXNFVjFwT1NPbFRNRm9l?=
 =?utf-8?B?ekJ3M3RUa2lnVDNTUVBjeEJXM1JjcVgxRldjMWhpTUU5emZJanMzUjYxbTJP?=
 =?utf-8?Q?Nrpni42UUtV8csoFNrB7AQ8=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UxqYdUfs/Xpw70eQIN5EyDBdaXbSFVFmAQD85zA/1BwoShvkQQ9tKmjeX6qbqSiTnj2uxP0xESdyf3F/vpCBp5Np7tr99Ej+xyLUokK/OEdPGONYodXVAWynnW+PHY0uH7IqFTqZupiBzp07yc1y08NG3e79wMwWQnv9sRRF9lTIcV5Hblm1V6XqBkvJK7J2JO2gCLfemuUYmqx300H1Cg5bWycHk9o2Yi7Uy9E4MDgbOkr7zSZfsz1R+Jc+I6rZ/8yh90XGoeaLoo12cAQDmxBVOSbp9KjR8PpvFxhMNXnPEfk70kKULITHzvtWV97iFIwtzT4e6JwNiXZsf8FOqWCQOPyAcJp4bQ91HtEa+Z7veuW5hiMErImWQoxuBcNgsuIzcWXxhragFALXBPRo+5MukjG/9W7G/HU4pEo2yj/IccECHEaBCZua6xHkXYDvdZSV5eHmcdbzx1do/v7SFTWMshsFZxSbBoJbVdQcQrAY3NAjms7PMtMqdofR9fMSzCqPD7w1/u9MwjpDfbbyDUnaNhhYJKfavm2KmVrTiNNEp+nYsn4e0/nvH47p5vQnpWoBchJtCDdPnn9VeCeNXRiubt1oVGZqNiRYOsXvIzA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2eff063-2f77-49b4-4077-08ddf6e89d4b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5081.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 19:21:50.4501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vhI7aMateTnHIJpkhJI7HN4OWoY8is4UvBva+weT0SFVY/ZPgfIYry5SFVcieVFgCj0eHS1rpYMbkVqwrd3Ql0dTrtD9359qQt+IqLAtWhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7233
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_02,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509180172
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX+bs9yRISNoVT
 DuU4B9N/1jmZn67Xol4ydwPXHYgygbNrnvoH7jvuAtFAYl6eKBpNnNdPg0JBofCAEuk2QYcUzq3
 qOqgcqDON9ayPetVL/GHvU9pkIP/EzQxqXQCir1Itfd/OPyqmyQY8+PY2xr16TNs3MRgqHeubd7
 pobcyR3yohDB3FoIP0OLJ1Ii8OhD8SaOgFBxIqTV9wCrdzFx/MzOkfdDknSDcSO2KPO6z2nIOk2
 2JehsqY55NEjAgHsvnc5So94nV36IrmHdcNMH3C7yPVpmuIGUgeq7/8R8wWZ07+buBDo1fIkmkG
 byex6Bd0GUvKVQS+Xd4ByRhHQten1VQBs66hPlVXByywAxmls470bvbDZXLzkHMY4vzICWlg0J2
 97KqAD1t+kVqJFFCbRqotRdS8+kdxQ==
X-Authority-Analysis: v=2.4 cv=KOJaDEFo c=1 sm=1 tr=0 ts=68cc5bd2 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=xoYZ7g1evwqHKiB9OSMA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12084
X-Proofpoint-GUID: XlSp95P0hyAyZ0dryZ5j3Kh_hxi5nhFZ
X-Proofpoint-ORIG-GUID: XlSp95P0hyAyZ0dryZ5j3Kh_hxi5nhFZ

On 9/18/25 1:14 PM, Nick Alcock wrote:
> On 18 Sep 2025, Elena Zannoni uttered the following:
>
>> Make sure that the examples directory gets installed. 
>> It will be installed under /usr/share/doc/dtrace/examples.
>>
>>
>> Signed-off-by: Elena Zannoni <elena.zannoni@oracle.com>
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
>
> (Though this seems to be built on top of your previous commit -- I guess
> they'll get squashed together or something?)

No, they are separate patches, I used the same branch though, where I have that other local commit.

>> diff --git a/Build b/Build
>> index 1a66a824..220c9784 100644
>> --- a/Build
>> +++ b/Build
>> @@ -7,12 +7,18 @@ install::
>>  	mkdir -p $(INSTDOCDIR)/userguide/explanation
>>  	mkdir -p $(INSTDOCDIR)/userguide/how-to
>>  	mkdir -p $(INSTDOCDIR)/userguide/reference
>> -	$(call describe-install-target,$(INSTDOCDIR),README INCOMPATIBILITIES NEWS doc/userguide)
>> +	mkdir -p $(INSTDOCDIR)/examples/
>> +	mkdir -p $(INSTDOCDIR)/examples/language_features
> That first mkdir -p line is technically unnecessary (but harmless).

Ah ok

>> +	$(call describe-install-target,$(INSTDOCDIR),README INCOMPATIBILITIES NEWS userguide examples)
>>  	install -m 644 README INCOMPATIBILITIES NEWS $(INSTDOCDIR)
>>  	install -m 644 doc/userguide/index.md $(INSTDOCDIR)/userguide
>>  	install -m 644 doc/userguide/explanation/* $(INSTDOCDIR)/userguide/explanation
>>  	install -m 644 doc/userguide/how-to/* $(INSTDOCDIR)/userguide/how-to
>>  	install -m 644 doc/userguide/reference/* $(INSTDOCDIR)/userguide/reference
>> +	install -m 755 examples/*.d $(INSTDOCDIR)/examples
>> +	install -m 644 examples/README.md $(INSTDOCDIR)/examples
>> +	install -m 755 examples/language_features/* $(INSTDOCDIR)/examples/language_features
> ... you want the files to be executable? I suppose they're .d scripts
> starting with a hashbang, so that makes sense.
>

Yeah, they are like that in the dtrace/examples directory, so I just maintained that.

elena

