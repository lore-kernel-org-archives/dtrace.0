Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348A1B67E
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 15:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770736734; cv=fail; b=V+aOFcPrg9Axpww3zf7W3fQ8T0nJoSyF0mJTHrLz9xJ7N/S2xQ9BVbnsW9CkKEfHHh+4CvxbbF+ZygZyDFIQ4StoyaPTjzdG9dClhbgApT165daBVs9VRaVjVuRxREjfhrvywsB3FgAUjONjyvLCXVbGEPImRE2toRQoXBM71QQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770736734; c=relaxed/simple;
	bh=fjKV3YVVSK2YB3gLooU0ZxCS7vkzIgOTP4Uk/9ju0/E=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=HiY6qM707ZirhoNbPx62qcJEAIydg0Ri0Z8sBgPJ/YN0hVOrEz/efxSYO1p/vM7wZTbGX9ICYxDxvyLrvmvw1QGo7DLEZnYtfMQZOo1VWNVp8iGsM5XXwEigZwi20Rcy6L586J7At8eh4W7xPE2u9uAozUI43GJXMcZoo5rCKqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=btvsebUB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nPzcikQN; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="btvsebUB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nPzcikQN"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A9v8143796717
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 15:18:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=EFadZo/Dri1ba/UKQl
	2AwqVdt+HsFgxNAWJB/Dy1YJM=; b=btvsebUBmcwE3FyfVi5Uqo9wXPwU43fhLU
	aDrmOLWpB5ZBNA8ZSDn57UFxo0+RfKaNSHfjko1Pi6lO5a1U1+co3ohqGrdKzpTT
	wDg0Jcs42nRlWwCVr3RWZRXFDCN02XBPtxUngmiKb0mviHixRNyYZQsY/Wja++St
	TplJWnjxkvCiaZIl4ADcFaWHctvvuBu4n+IrAs1YMyGTdhoIDgSRcQBO4G0xPy9A
	lMN3NGxlIi7HGRgZvXEwARAbDgp5HIB/1GqYRbkYIVEUKDYL9SlGdXBQJ2fY9tXy
	NgxKWQDtz5S6Yq9dIj94vZKZBcs9dVpmI2YtMT2aSr0sMwcdp4EA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c7s7rs52t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 15:18:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61AEd8q5033686
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 15:18:51 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013050.outbound.protection.outlook.com [40.107.201.50])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c8244wan0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 15:18:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZQzA5/1xtfbMNpg22g2tv0Ui+yzKfET7mfwctqasDXkBy4iGXBRN+H9wtXL4tkaSW1TGWjtfI1K9f4P9DTj2CkrjScairYWsKSB1crMmQ1PJZvJtCX60f54bdcI3Cr96puQJqW6pZjDRG0B0u3rMDs5l1O507sUV8C+bIZj0A+TtvFIh7PiUvhb/0KLI5jiBtxiR/8ImHXMUxFbRN/1B1p9y8dql48f6nnJz/ZSJf+e/l8kOT0xbHUTeKoVtigyYxNidy80gglQ/IGTG453Xjj8HCiSKi3UhPOsaT0bOxE1LX6K3IeKXEdIL0FBRK6FpYEEJ3TxMtW15lBZsBYkow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EFadZo/Dri1ba/UKQl2AwqVdt+HsFgxNAWJB/Dy1YJM=;
 b=Cf5Uy9wvT/KmWvPEadLzxqgbdeEipKtvt/b/toSZdP15xr5YD3baO/0n8a3qAr9Zwd5wZGaV6E9uLhEvkSF8e3br4j9OEvQG7Djkcg0ZC+9SaVKY00EuPM4fupQzVFpp2J5NxsOEWHT8pAxWdumoxwtfCme5HCW5+4J0/8woKgYIphS8MrLtBcHXAF54x3iKNDL7N5b5sJI3e+sLefVk9Sb9FV7XSZsUZAtwQJqT9WZDSv5QljIsSJ3D3Z282FoQIogMxxDcIZuUf11PV9z9k3Y6PRR8280UNNZuwKA9OTuehXFzQW25CUagj5vqf1cxNvCc9XaozL/pQjY9smaB7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EFadZo/Dri1ba/UKQl2AwqVdt+HsFgxNAWJB/Dy1YJM=;
 b=nPzcikQNv6l68/28SxcPbZwjN+DMbhHMgAjAlSxeYFREIFJpdkGhMC5YTErY+NEf5rN4mSbQgbUYFLJICxgHzBd3eKdkMMhn44YH7wZ3Lu+0Dx+SMDCUeNnimGk1aZMBN92UMdK3Ig8NrWsOypeFIRPiIo+SqVH8YAjaN3/+so8=
Received: from IA4PR10MB8709.namprd10.prod.outlook.com (2603:10b6:208:56d::21)
 by SAVPR10MB997819.namprd10.prod.outlook.com (2603:10b6:806:4e8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Tue, 10 Feb
 2026 15:18:48 +0000
Received: from IA4PR10MB8709.namprd10.prod.outlook.com
 ([fe80::8837:6d1c:c62e:f470]) by IA4PR10MB8709.namprd10.prod.outlook.com
 ([fe80::8837:6d1c:c62e:f470%3]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 15:18:48 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH 1/3] pid: ensure pid offset probes
 perform lookup with adjusted address
References: <DS0PR10MB7522F3DF908967F8E1681F5BC265A@DS0PR10MB7522.namprd10.prod.outlook.com>
Emacs: or perhaps you'd prefer Russian Roulette, after all?
Date: Tue, 10 Feb 2026 15:18:45 +0000
In-Reply-To: <DS0PR10MB7522F3DF908967F8E1681F5BC265A@DS0PR10MB7522.namprd10.prod.outlook.com>
	(Kris Van Hees via DTrace-devel's message of "Mon, 09 Feb 2026
	15:43:47 -0500")
Message-ID: <87o6lwr5ii.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0106.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cf::13) To IA4PR10MB8709.namprd10.prod.outlook.com
 (2603:10b6:208:56d::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR10MB8709:EE_|SAVPR10MB997819:EE_
X-MS-Office365-Filtering-Correlation-Id: de85f4e2-c503-43bf-25eb-08de68b7b03f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mrajWm1VgBQ9oDtyqg7UCPeT34Z55JO7LQF9gC74wTD3db+HA9xWQ+mTh4NF?=
 =?us-ascii?Q?IFT8QuR/7sNWvB3V5hSve4gE8L1PoTwjNvJk03Id28mY4YzW5KBMqHR9FWsw?=
 =?us-ascii?Q?Vf5ePfr587WTZWkoYb+VIsrUfXcw+Yec2ftSCrEwwd0zubBhmb6Yq605fqqY?=
 =?us-ascii?Q?1X2d+gDj6d4+rMxcdz36eu39QuXCks8oi66yDcwMz0hF9kplB+7RZh/BpdoR?=
 =?us-ascii?Q?rT64xmDWV+xMM9oNp+yXffaaZUfz9nmKnUZg6F1LP/BYGUOyN0XvI+4xD85Y?=
 =?us-ascii?Q?Eb1Sw5fq6hspv0lSiKwUVjlttKtfRaFodcd77U4d9j7LutIMokQm7TC8lTL6?=
 =?us-ascii?Q?qIlGWpGFaCzaDVB8eD1gnUECupk7SfqwRWlkDWe4MJ1m427/8SMr8Ny4QM2B?=
 =?us-ascii?Q?Z0cmRdu5ilCRyBQ3kA64mpCtPgeC2+93NzUWj3seKAts2SL3PvY5GlRioarr?=
 =?us-ascii?Q?XviZ6wbV0KMFWGWfIamKQjPCFNlZzT1haqsTf/rd6a7bQvkA082aMqq+dKob?=
 =?us-ascii?Q?g37QC7UMhCEsOOjUde/BkcbQRagfNlOXlcH1CBs/vCRY4rP+spD0ZoBqM+Af?=
 =?us-ascii?Q?AgQxiBn5fAvGTxH6p6/rW3lxUh80OYl2eYZHwEc5OB5odzV6G4uWvBQSs8TK?=
 =?us-ascii?Q?7OOZA/xDaN2tYc0m86YupQrmOKugVSCmzTaRl5OlmK1VEyF0ZrvJqFWl+AUU?=
 =?us-ascii?Q?7RIjf5yxIWkj0XNWlVRer1KtPyQW95st4lKbUfnOrQiAxOJSCIKTe1dVOM1t?=
 =?us-ascii?Q?Jm+MP1LVG1zO5w5vkjlnAjTH+IMljOyHqvvWVuIIC2iPmfjEmpQxIOve3fM1?=
 =?us-ascii?Q?ZQcGvG0SW3+GuQsBmAntn8uiJTv9oA6xcj1PEncht46/4LQbuvTfEOnDSJ+e?=
 =?us-ascii?Q?Ot7r8n6jsoUvl4OFQ9IWdEvKk666jvWTeUQDqfQRP2Wqv1CljsXo5NEtjjCJ?=
 =?us-ascii?Q?C2FIdAlyFi4oO/HPLo1pcm4eUPYLBzVQqxuLCu8LgBqSXlK0B+3K2VgCmURB?=
 =?us-ascii?Q?3rZVJwc4uLgPabIr6LOvFoyWCxaJ85uKe5CnHstwj45SNNaFvdby61DUT/Fg?=
 =?us-ascii?Q?+LX6io7QV1k4MK7ZUa8hGcOBXAd81P3S/Tx1i0d8x7vB/LS6d/ZCbCMjq2xk?=
 =?us-ascii?Q?ZzW2h5gKIBTlO4mpAXFAnC3YdOdFcL9xNw60+U0XKG39yJB7ZQZSNFtH/3fa?=
 =?us-ascii?Q?HLjKulRr3SHulC9sX6xlz1Ygs72tYxQL97FEHUPIHm26MuW1Wl9hNt+oE7I4?=
 =?us-ascii?Q?IKNZ7TlHlYiSIStFhTFJzjHAnU+gVEIss8WiYtdW/q4Qd4jZPlCCKo5CZoSA?=
 =?us-ascii?Q?yBE+9Vcao8F8l5Sel6vYwIabsEu70/L766srokezMxedDWjlHBRT4kj00DsC?=
 =?us-ascii?Q?J490cqG9oiKIRf5iqZWkzX+hooG51Jf1BNc7nUegfFohKQzVfl9sUueHSHAA?=
 =?us-ascii?Q?jmDwLmlSCRkPImT0t+PeOx9PgSiTbMgvOXpCqxOzfvz28pLNwJNUaspVJDEv?=
 =?us-ascii?Q?jEs2jWujC6F9t+d59D1BK0euCXSuXkRyaMsy92lyHSArg4WkkxH9JyVh4b6m?=
 =?us-ascii?Q?5O2NeWyhI6jbX18ojrg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR10MB8709.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/1HyxDIhfIpId59fLyBDgtt7X/AiA+cGyZVfQY5IRiuG1Uj4KcDwQG5YrrcY?=
 =?us-ascii?Q?WdN20HLjpHm9RbQ+QiUQXXjmT3HoLAMOjfF7nqh8wK6+BUxgQWjU2BaUD7ym?=
 =?us-ascii?Q?ALa2rPKagK5xubEMuaQic9zvxBTQcj/U4CBUyr32d7MH/C8ho28Wuw6r5X4a?=
 =?us-ascii?Q?cYe9+gEVYx0ZKQdev+jDNXMq+4+/mjOcuH8jEOYElMzOjkVgstUgSgY/3RMy?=
 =?us-ascii?Q?3ANnRfjSYRAq6mFOeNVhHO/YZpM8nA93WFznT0AIylJoU9Okwni4/VVbNzs4?=
 =?us-ascii?Q?Nk+aToJwlbBjNmjHDtRWtwy8ThJXGoz72htM4n45xhQJLNrOE708nlWA8tDc?=
 =?us-ascii?Q?koWTvqLttvuLvIus69jTelBFysn4W9JzlnO3Rqg5SIACHe2FylKuHsPjMkPk?=
 =?us-ascii?Q?nh9rIhRGUz4jrJuAv/Pv8DkNjqdZ1SVuRYEgL3WI4oDHuOOMY2t4DFcHVMkg?=
 =?us-ascii?Q?hgVgh80XWXl0R2yvkza3ktSOWe+fPNTD04RA27UGZB+viPCgMhf5GhBJ1+Ac?=
 =?us-ascii?Q?WsAXd7kaEVJTwXCMWVdZki/87BPzU/v24i/c0Biz/KNSjembGvQtBVd9hoH9?=
 =?us-ascii?Q?8mqWUzzxwxqFWUXIMlnjlthaCB75pcaWXNTpXvWJj6XXkWpWEOlkD+4Pvgni?=
 =?us-ascii?Q?0eClfBVtX7Iueu067ZeOsn4My06RyJBjh7p4dbhwqKEvIOlT2GSWh/OGP4PR?=
 =?us-ascii?Q?34C4pcYc6vbVPwL7UDTyrtC2PV+75a904pe/3MIqZB50xeQfwTvbbw7SHU37?=
 =?us-ascii?Q?0iKXKk1oxMQt3FHTsJwXoEOYOtmQTZdfplqX2u0b94sySIRoUN67PpfdCdCr?=
 =?us-ascii?Q?rS98QVWnu6zxKrToPMQxHsC56HOo6zLZST2UzmRj+SApYqbYdD8bRX0pLaz2?=
 =?us-ascii?Q?4hBUo5Xj9OvaQ7BlH0IkkFiBzNgKIWnr8PXZQlQQBeb6uNc+UomQMi6XOF7k?=
 =?us-ascii?Q?hKkei32oCJ/wDHiV/YJ0i1pLrZBPzYOXhDTewrQiaQmZeEsX6t4t/ScC3sTm?=
 =?us-ascii?Q?XZgfRxPT6syv5PG01pgO+xRojNYHzxtlsm9ts5GjjQY9nH7w0xMhBVYOWCo2?=
 =?us-ascii?Q?Q4qYTuu30SsMp8/avC4ZTm55q1Y+YiEkGkPnhpGZtj84y4DWyCALkQZSVrTX?=
 =?us-ascii?Q?i9gBneIiHtoGP2Qy0l9boyL1n7kIxYJFFsl+I4gOy/gN70UwLgeYCOW9+eFW?=
 =?us-ascii?Q?XkC1OgB73VvcwJ3c5ixUQsmVs7nO2J3fkiLoX8Yuwsc0iRLd2IPi2uZaAXEa?=
 =?us-ascii?Q?lxXd4js/pYuyHcqtlKgkBIIFOc71QZdw/y6lnywICrfHxLFDqWwZushr0UGJ?=
 =?us-ascii?Q?NKL4H+sU41hOkWJKPu4uMb11mfwawufHjECYB9viRsPzrz82F5Ioconi2v2S?=
 =?us-ascii?Q?sKVDNxsikhu40SyblVoEr8lTrs4O++5zXEjzptULAEVqlLQj/0cp+8todUUA?=
 =?us-ascii?Q?NmmsyoIe1rTCywCDz5hzPkRUgcPH0E3UXcEEnrxicmDyLL+ouWxgTPP1NSH4?=
 =?us-ascii?Q?ARbyzN/jRO/Xp8WcZZtfEEKKEekx22XLPMycyyjYrF5uy/+wZbBTLeDdPuws?=
 =?us-ascii?Q?g64k31IXqunK/KTadw9ENPII+kHPOt+C3/aKicTlv19xqKDyksdvzZ/A5NaO?=
 =?us-ascii?Q?db5dRgiMRzbAj/zFwjxBf/i2Izh4eSsjd7f8LegoOLFfnqAJqi9lmgZ7DA0L?=
 =?us-ascii?Q?zVfCGHr94+ObxNj2Bbyo41xus4NOuvVkt1rTEplEBug2CnD1WGtdVSm2a7Pq?=
 =?us-ascii?Q?yWzsSNTq4w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YeaTiuMO+EJxo65MNfWxacinMfOsOkj1XPjAttUHjuV16KXIuDGaYVgAMf485FF83jsnpyCsTfPMzwe00+Q40suKmqmevKXCHPVN0y0b3yxgM7G2TGZxO2Ja8I0mHQqy+VVKzQVcsJsxrDMOHMSw9aBF8I1zrTL2mBYfC5za9NehCog3bIUigT8cmdDeFPCQodeoJYQ/NPnT9sFhc7ZpXmHVtLxKKwOcC10VpeGZxHMAAlm520r5TMS10vFy1stJbyIjQ/clfVIWCku/EmqCLt1OMaG752BtgB4s2s0myeE5ir+oIqDvNV+HeMoOrKsOwugosJeK/9jboQwoqmEg/YE2E7Vv0oRBYFu3D8RTTJ5mhToXLuzrmdbdxUvbzaPue8dQ6Y6GrJ1Rt7eMXXHeG7fuqpEM1h0KfnRvrxJ0y/fSDDh1vDhkM5Shmvn4ncVOOb2UrFVeI2/H+0FKo0nAykC6dYuHmcUAdox6EDHtp5SRpkBcS+sFJO49nE7KH47JT2fTVk/Pe8GDY48CPcEKttrDTvKvrpc9W68ci3UtWTtyJZc2kTwdGEjcjTSzDww3C+5CYFT0Db6KjL//zNMpuHrMGH6fL7XPdswilucTEAg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de85f4e2-c503-43bf-25eb-08de68b7b03f
X-MS-Exchange-CrossTenant-AuthSource: IA4PR10MB8709.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 15:18:48.0944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0RDPK/7VmXURHRR29g5aUzNUma7ePenfXtSP6lFi0mzKMGP18VIiU6eg09MSiFQK1Wg1OLtG66xlgxr1D2DmXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR10MB997819
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 bulkscore=0
 adultscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602100128
X-Authority-Analysis: v=2.4 cv=PZbyRyhd c=1 sm=1 tr=0 ts=698b4c5b b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=OVTcFlQqaWuKfpIeGt4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEyOCBTYWx0ZWRfX3G+RQ2NkMxgy
 sN0OQRjNKSjPZaGhqe3yg0R3F4bN8c1NXEeymh1st7VkxsAwmHowG/r7p0VI5kbrmJTenhndmLF
 YR08UxTnWRmXzO4tTEyJNYgTnjloNYBiks9T6TWCnFSTyo+vNTfnJlnckuX4ywQnZozLSIYnlo4
 z9utkxfCcHxrTRBxlL0YG411MURU6R17i6+JS/R1oOBGNawWFKmatdKorFodiDSw8fLP6SacvEl
 FXpGOnvdlzuWBbqVQfvbe3Jl9O9OPrhEezbhhhCN8fL5LgpuwIcgKG8wPh2xWjnlO0rgc6Jo3pd
 OceOH8WtWMZ10acmQt8VY21HF4KT093+hBUUZTeZHwBG6Ec0CVUXYaFWQbhojZhZvJKqvtWjy4I
 KqD2MUknVQRJH8LO1op6gv93cPO21GHWkPfwSYohJ5f+BkCW+AkllbJFQI6p9tgUElDmo3hVbFK
 AEDdRAz3nXidvsQf5CA==
X-Proofpoint-ORIG-GUID: 7aQ4ra_fnqvmddOKzIiuuOmovpqlH2MI
X-Proofpoint-GUID: 7aQ4ra_fnqvmddOKzIiuuOmovpqlH2MI

On 9 Feb 2026, Kris Van Hees via DTrace-devel stated:

> For PIE executables and libraries, pid offset probes need to have the
> address adjusted based on the actual segment load address.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Looks good (in particular it's good that we're actually recording that
this is PIE rather than relying on a usually-right guess), modulo one
tiny nit:

> ---
>  include/sys/sol_procfs.h | 3 ++-
>  libdtrace/dt_pid.c       | 3 +++
>  libproc/Psymtab.c        | 7 +++++--
>  3 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/include/sys/sol_procfs.h b/include/sys/sol_procfs.h
> index d195a108..950ab31a 100644
> --- a/include/sys/sol_procfs.h
> +++ b/include/sys/sol_procfs.h
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2022, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -50,6 +50,7 @@ typedef struct prmap {
>  
>  
>  /* Protection and attribute flags */
> +#define MA_PIC		0x08	/* position independent code */
>  #define	MA_READ		0x04	/* readable by the traced process */

Tab/space?

-- 
NULL && (void)
