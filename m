Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9D1125A9
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 15:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758640543; cv=fail; b=TENKEf8PC6/tp7OsL4dZZKptg/eh0gHOZWnUS0jpriUe4cnA5P1lBN6ppFymkSGQdXiWqoh2eHcLZZC9IRlT22WwxaGek2X0uMu3GfeoL7rOhjtPQjPbVhf+65VAZ8nzcevTl1ZI3xn+7AcWqBbKjHtk/S57m1iUyhNg2HlyFe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758640543; c=relaxed/simple;
	bh=hGeE6vhx4IlV6dDIFrP8ngksQ1FDj+x/IzeIhrXx/1A=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=GmGvmCHxmwp5eeWC0ylLFbII7dwXvDs+CPz8Wt72FOPzhPXCTyJLZM3d3Ch6brO9ZsztPjE1R9+Ym9I6MXVOPyG1xau/ndU1AyDruE9GOvJ0Qbd9+PKxNpyAa/dazwMLsnBLiQanBci/LFHzkXPMmnyQamoa9lTVQVw1AIlbhXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=H+n7UAWs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=o7CACQV7; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="H+n7UAWs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="o7CACQV7"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NEY408012547
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 15:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=hGeE6vhx4IlV6dDIFrP8ngksQ1FDj+x/IzeIhrXx/1A=; b=
	H+n7UAWsPGEaFio5iH7LnoTHV6NzDgM6aV1P1hpvYeJnpJTuf0fFT6g9+u52FJtQ
	CoeorFoia6ubWdPQAXHZxvfdo08lXHowsfcHdJRFSispCZXk4yTlYVUp+tFJ3kzW
	fSpAWgXmQzsZFYVWASKqXXN5/zXAnHjO0rhTlLToKsiEMONvKPnutWnikf00VPUk
	y3AzpAsy6jCJLrYTZUU2Zoi8HdvLvDiKPpXoQcPEQUPHYEhiaoKYTN27xP5XaU+Y
	c88HBcjSl7w0kWsPjSSk1AdvZGUZxIOSBR5GeZT6aUoI9CydcLDqXi6PrLd2NV2Z
	PjqE6YrG5MZlm5w0rs8vvQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 499mtt4vng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 15:15:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58NDxV6Z002141
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 15:15:36 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010054.outbound.protection.outlook.com [40.93.198.54])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 499jq8ba1r-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 15:15:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cfcZ2eoFQQcvo9U7uckho1tHKfOPFpzyRMm7q8fsGxmzO2qaGvmTHhncseZB1Tm9GuvsqA0PTA5tdDzExd9un0LtvxtCNgBlkxncDkeBj9eZGjw6NCLbs08qUjOFDcmv1aJdNyrPdPkE+4VJDU1cLVW8gGwyBp1rlQQ6brhS1ElQwJ4o83rZ8zvERo3elj+WS33+jtp1+Wd2Rchu1pJSq+hv/V9xt0L/VFRVZxqcWlYBeBJ/vJOMm/Q55oLuDfDEOJ8EftOryduND278fbdSSN1/4xD37pU6RsW7yg4xFHostPEgj2davxF3PZ40kYUWYy4pWJZARJJhsPgtHCilWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGeE6vhx4IlV6dDIFrP8ngksQ1FDj+x/IzeIhrXx/1A=;
 b=c0Iy4Y7l3kVkhIxdpfjOjjm/PJT4ZqMmWGPp4xW56LvKEA6INfhKDAAWZT9/ThaRdB3AUFKBrtAjfsbp0RytN+/DRo8zB72R57Jrxm70ArPTGZv3J/fk5gwmJJoqZ0w7XicFpK3sVjYZSLqZV8uwWytf01Y6lOnMjY8pxx3vpwE5wk0LAx2jmAqmTIDcNeQ/BlBKfXatn69O5sz1UWfRwHtCr8H3l+cW/Z9owmFu2WxpUq0UvJ/3d6MmcqQVojui0ASqJEgyr7D8Yk1eBIGQjO9PE/QiMpDiTtYC2J0qPMNhaYIh99BwWP6fzSeTvARwKcEsV9kd06U57ZVP3IgqLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGeE6vhx4IlV6dDIFrP8ngksQ1FDj+x/IzeIhrXx/1A=;
 b=o7CACQV7ffGUHbfinwmchByfH0aR/jwWjdNwnfLo+mIY9AnhKfOG2Rm0NASaJJ+DTdA3R19iYkqrQLdzCJ59kJqg9nLCBiV11MjuNBqGiVqGQdFSvWGMwLAfyvFBVa5MqiYGInL/1TGytwHtQDVMXuN0uoGYQ5QDLbuKbw2QuSE=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by DM4PR10MB6864.namprd10.prod.outlook.com
 (2603:10b6:8:103::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Tue, 23 Sep
 2025 15:15:33 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3%8]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 15:15:33 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: <dtrace@lists.linux.dev>, <dtrace-devel@oss.oracle.com>
Subject: Re: [PATCH 4/4] test: fix test failure when no /usr/sbin/dtrace exists
References: <20250918180338.197827-1-nick.alcock@oracle.com>
	<20250918180338.197827-4-nick.alcock@oracle.com>
	<47bb646d-eef0-bff0-cfdf-d0775154dfa7@oracle.com>
Emacs: indefensible, reprehensible, and fully extensible.
Date: Tue, 23 Sep 2025 16:15:27 +0100
In-Reply-To: <47bb646d-eef0-bff0-cfdf-d0775154dfa7@oracle.com> (Eugene Loh's
	message of "Thu, 18 Sep 2025 15:18:39 -0400")
Message-ID: <87h5wtgpyo.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO6P265CA0006.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::15) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|DM4PR10MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b65f627-2cb4-4848-581a-08ddfab40999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlMxZmptVWdBTHpybGlhczFETTRtWVlGakxUQ3czVFArRzJLWFNsQ3ovay9I?=
 =?utf-8?B?aXdTZ3BOOVkzTlFySXZlVCtOSEtySkF6SzNKK3VMM2VPTUJhQ0Zua0xoM2NL?=
 =?utf-8?B?ZFU2RGR5dmlUcVk3cUp5cS9SRWZzdHc5M1E1dWVXd1VJOXVNWUhFcG1SbEs0?=
 =?utf-8?B?NUZGeGQ2VmN4dkVMUERCanI2OWRkTC9zeGwyMWMvVFc2ZU5DSlZwdjZJblNC?=
 =?utf-8?B?RnVCK2hpTWp1UThLZ2VGd2hEU1Y5V21PUkVURWozZDNGTkk0eHNJRXk3dmx1?=
 =?utf-8?B?dklXS0hOZ1Rhbmt1dkxXNmhQY1hNUHk0M0xzUmF0aWVPMkFpV2NJcTZTRGd6?=
 =?utf-8?B?Mk5UbU9FTHEyeVgwZUQvanFjdkxNWk5pT24wWHhVVGlaUVpZaEZzaUpJd3NS?=
 =?utf-8?B?RXI3V0ZkYUpXcm1HR1BsK3J5TTIzNis4NVN1WUhteHdPdWo5ZTBabDA2WlB2?=
 =?utf-8?B?Ynd2VERvOUM1T3dIT0ZMNHpKMXFocDd6ZUN6ZnRYNjRLUGxxZjhXcmhWdnpZ?=
 =?utf-8?B?N0Z6Y3pUVU5TNUo2ZHpDVW5ZT0c4Q2Y5RGxaeU1MRWhzODJRUW1LVUc1cmlq?=
 =?utf-8?B?ajBuUHYrK3lFaExjWG9IdDhJWmRycGp2Tm1sbGtteTlQWDZ3cmczUWZZK1Ra?=
 =?utf-8?B?VFI0R2R0eVdBQ0V6bzJWOGg3SVM0RzNGRksrMm00MVFiQUJnNXdkZTB6a09n?=
 =?utf-8?B?U3oyZHhOemdHQ04xR2lZVWZEeVlGVzFST0s0RC9QOHk0QXVMZThYVE9XSTFz?=
 =?utf-8?B?R2txN3A5Tm5hc1lBbXllOU4wcHdzYWhlREZVNE1lbGtYZ2hNTTlpazJwRWEv?=
 =?utf-8?B?M2tZME9UR1NGbmtldE9DTDFTOHYwQVF1N3N0dHcxek5DVU9UMkNCVzNKQ1JQ?=
 =?utf-8?B?VEhKRENVQ052L3BKdXpRN3A5YmhYZnBMazlJcGh4ak5LNnU1MSs3QWs2Vi9X?=
 =?utf-8?B?MkVVZHhDTzZpVGMvOHYrSG8vVFJwWlV2QldWbHdpZ0dVMU1pTG1HL1dhV3RR?=
 =?utf-8?B?UEtlTzlYRnUyUkNDUVVmKzNoMWFmUlBCb3ZQMTc5V20ybytsZUZRdlNrSFpq?=
 =?utf-8?B?M1hBOHdRd08vQi9wUXI5TXhVWlN6QzMvNW1RQWM0ZnF1RHZ6M0h2TGFzL2FG?=
 =?utf-8?B?Q3BLVXIxT1VNd09RQ2E4M0Zqbk5hRlhxNUR4dXEwd3ZZMnYrY1BVSmtZWlFS?=
 =?utf-8?B?ckJ4a2drZkIyTUJRWTk0Ry9VMHkrMnM5ejJuaW5HVVhORFZBcWV3WVZpd2hz?=
 =?utf-8?B?UmprRDEzaGFCZ3M2c0FyZ2c4U08xQnB3b2Y2TFY1T3AwUXV2MzlpaWQ0VzFW?=
 =?utf-8?B?TUlnYmVjV2JTeVZqVEdyYm10dG1xdWJYYSs5TWJwTlRTcjlENmdJQkpYRWJO?=
 =?utf-8?B?aDc5am1uNEpEcEVTeXBqa2ExV1haV1o1NjFKM213NkRpT2NyeFp0RVFweVF1?=
 =?utf-8?B?NWtaSFlBZ0ZFK25OMlZDYWF1U2JEZTFGa1lVdXZDdXYyeUI4MExCQW5VQllU?=
 =?utf-8?B?cWtxeGhOL0hoWUEwcHUwcjZGUjNtNDZiZkNoK0lMV0d3TjdDNWJ1YlExU2Y0?=
 =?utf-8?B?bUxLZ1lTYVVHSVZUK0VyT3VxS0p4d01iSEk3bTFaeXh0V05udDNqMGV3U21X?=
 =?utf-8?B?QUYyU1VBL0JiaE9ReU5BSlB4c05YbmtyMGtaMjRMRWJWbmNxZ3Fqck54K1NI?=
 =?utf-8?B?Ym9VT0dqZnIyZ1ZHREdsaHVZM1MvaFhXR3B5UnBPWTN0TE5xWFV3ZEhGY2lr?=
 =?utf-8?B?R3lCM1AzQW1EVlBpK2N5RExZTmNrUU5qY2ErRlVtTGNialRyN0ttSzlqNG5m?=
 =?utf-8?B?R3RJK3JGSGlUME40b3c3SkJkMUQ3ejY3K1BtZlFISmp0Yncyb1dReWlGTFZj?=
 =?utf-8?B?M2wzV0owaG5kZ1J3SHpDRjB1eTkwZWhHWGM1aC95SEk4ckw5amIvejZtMmxv?=
 =?utf-8?Q?xi2n3efl4Cc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWowa1pHTmlaOHRMMlFzbk5qNE1QbWpHU055NmMvUkJiZDdWUFczSmluMUlx?=
 =?utf-8?B?Y0VCSFJrRE5TVzUxZXMzSW52QXI5SDB0Q0NVM3Fmejc4VUV6RThQOGxLK2N0?=
 =?utf-8?B?QmlheVBndjBxTUEvQ3dQOGRabzNubWlMd3FHV2NBRExTQlVaVTJqeFZKY1U5?=
 =?utf-8?B?bUxHKzBDNWNLL2c1M2hyWmxUbCt1czdtY1RZM0grZXc1TVIvVjh3ZWM3OEd6?=
 =?utf-8?B?QkxXczhQc3YzZTNnbWRmYmZlZEgyQzI5dVZqamFNYkxVUW4zbEw1REJMd0NN?=
 =?utf-8?B?MWljME4wTEZQbTRVWVBUTEV3cVJYK2NEUkFIREF1Z0J1aTcrUEFiRUxoZXBw?=
 =?utf-8?B?cW9zbWRMQzRxaVhrTHdDbGE3b2Q2WVZkbFBMYzBDK2o3cXRsbDh5UjVFcStG?=
 =?utf-8?B?a01MT3gvK2xxdUZzaFVjL3N3cFdOTE5IMW9mZGFIMXBuQ056UGtsR3ZnL0Rp?=
 =?utf-8?B?Y2FObk1qeUVvdGxBVnlibllBdEVuOGdrQnlXVFZOck5iOTBtYWJCbDd2ckRu?=
 =?utf-8?B?YTFBSlFQN0pycFZ2Z1htWkg3TVBRckcxYjdueldVcjF4YzNESHRWYndKRUp6?=
 =?utf-8?B?RUYwc05Zc0F5Qk5GeFFIbkhOc3ltWk5EckdjNG5oSDZsRW1kVllYeWxqT2xk?=
 =?utf-8?B?a2FRZXhOQmFMNlF2ZTdPM3FmSjdma0F0UkR5LzRaTXJsUk44NmFvbUV0RVRw?=
 =?utf-8?B?WXA4UFZLNjlHdC9XSVJTbDRzUmszMGlwSWpHYnFiL3hsTktseGlycVN4UXFK?=
 =?utf-8?B?YVBHREUxSXVoWndmbCtrbzFZZUYyQkF0NlFWbGlDRG9YS3RZS0MzM1lUeXJw?=
 =?utf-8?B?a1NSa2JKNjc2RDhac0d5a0NqQzFtN01DMWIvbkRCWmkyR2lKMHQxOHViS2JC?=
 =?utf-8?B?ajA4NHdQamQyam9mNjdOcU9lbGtYT252SHNRRXdtYkxXZ08zbFZSZWRXMjE4?=
 =?utf-8?B?cTllRkFENWNJQVhWdFU4anlUNUZsOWFJanQxTWVBY1dxamhnN0hLQ056Rko2?=
 =?utf-8?B?ZDlHWldVL0grbVVVT0lLdzl2T2tXd1dTdmc0UEdSTlhQRkhXeG9JVThMZ25N?=
 =?utf-8?B?b3lWQ2F4ZTVmK05XTEdpRG1LMDExVHVhZVBQTHJNN01lZHZuaUNKdjd4b0xo?=
 =?utf-8?B?SHBkRmFBRTVtdlNmNnRHK2F4Q05DRXdlT0ExMVpmK2cyVFltNHlWUUdaSmpW?=
 =?utf-8?B?YU9xRnd5NVRmTHBMdUluNmZVM1ZzQkpNazMvUk1rWDB0Umt0ek4rZE5nb0t6?=
 =?utf-8?B?MTJnWDN1N2lOQUNrYkI2RDdxVkEwbXptZWF3RmcxanVUVDFzWDZleVdnTGE3?=
 =?utf-8?B?M05WUzZNcVJ3QklzemxhWnJiQ05FemdsL0JIcVJhUkhLRGlIeFRPU1ovenhh?=
 =?utf-8?B?dnNpQmtlZ2d0cGdsOHY4WVJzZTZqT2hlbG1USlJSeWd2Uzh5VzJsVEZUaWNC?=
 =?utf-8?B?VzFrbVBYaFRrbWZYaEUxd3VCdGpaeXV3NllWMEwxN0VqWnBTcHd1S0tTS3lG?=
 =?utf-8?B?a2svYnRFMENielVFS054UHRPd1pSaG9Pc1lVVndjWHl0MTgxQnNiUk5INmNI?=
 =?utf-8?B?ci83Yk5oOGVwQkJHbTM2U1Q1NlEyTnBNOElUWE5mRFoyUnhSUno1OWxnWCs5?=
 =?utf-8?B?TndZWlczRHA4MTIxNFp0Y3hsUi9IaDZaZ3J1S0hqTVQ4V09YdStQeXVUNERi?=
 =?utf-8?B?eXNpNlZscmIwcWVGZlUyeCtxaGQ1QzF6Y2pkeVlRcy9WTXV3R1VxRjczZEpQ?=
 =?utf-8?B?REJjS2UzL0pRQVFNeVRsQzBrV1dNbE1vOXgreFlUR0dxVDZJZVlvbVBaU293?=
 =?utf-8?B?VkIraHB6OGthNURUeGpaZlpzQlIzWEdBM3RzbWFIMm5reEFFRlRNekJTUW1h?=
 =?utf-8?B?S1JpT3A5T2d1TmhHTzg1b29Ndi9qZGNuNHB5SGNwakpqNkRMdGxBSWhwVXRH?=
 =?utf-8?B?aUNaWjE5RmZqcGFwVlhvS1pLOWZmYmszcDFzS2dTZUdzL2xmRC9Gd1hBSU5M?=
 =?utf-8?B?RG1FK2ZpQVErU3NoTkxvenJLcXl6Uk5pSkFhMXZiNllKZEkrV3JoV0NNNGhV?=
 =?utf-8?B?UUVBSkhFQ3VWUEVzQkJOb2loejJ2Ykx4bCs4RS9sWnFtQ0FUZVZ3dDM4bjJR?=
 =?utf-8?B?RE5uWjdwaTNwaHJLVzcxYXI3MXpZbDllNXV0S2Z5eXk2akNwL01ISXdTczZL?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8Yej0CUAegPvWOv5eBwHoEKyPZab4Bp15yxhWybna5lpWQBCn3ktmHbzjVf8LBwQxi0PHX6uFBkC7VGUsM6UheMTrqd1nzvI4L+BHGyf7fz3brATEobIkT61NZxN9rQ5TOYZdBiEvdjapTkEZ8GI2AcTNMHq5pR5l5wx8+s031MxPFuitLpCIYac/x5tMIMV6ZfP31iKMHk7ZcnIxLm2LXvONtAkZWjxkOGH5Z9oGpkhMNQwXeEypUdWfAKUNMTOFfTdw1yqHUWB1mvIcfVA8urnrfoj5OR42G9CrvDTiD31Bp+J+JV3KC97kj4rXEeg+MSCEp8U++BP98T55WcjN/dFC393fPP4+GnWpPmvxpzNQrVvREDldY79AD+7WFH4IIE9AtYqCTmSauttpl0FKElq2Glw31ZBEe8pO9wLg+9w7vsuPd8QB/YXgE8yvYTkZUA/+V9ESAG4mxPtbf+RmMjCQWcjc8JS7qPB6on1vOQHQ699M+G9aMJD/Ci/TJKGVvXuOnVUH0i6/ynGkckfqLRkpy/lDJK1RGbA8OPQzdXQGhYVfI4IsOAQClQYJ4GCdRclPJaD83f1gRNkr7NcwqwZhGRQeHC+r1bIl/4WuWE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b65f627-2cb4-4848-581a-08ddfab40999
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 15:15:32.1274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJ08BRXe4S1BFLg6y0Jh82UL064VcrsZDM6TJ16T1Z14zwH3HqjmAgqjWf0OIas0zWmuWD/1ABRClsxyuJqPrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6864
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 mlxlogscore=829 mlxscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509230141
X-Authority-Analysis: v=2.4 cv=fd2ty1QF c=1 sm=1 tr=0 ts=68d2b99b cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=9PektL8QXXnGt9I1G-QA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: djbAwuwWEMEYiyga7aOogfDIAkFb4smW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNCBTYWx0ZWRfX8hJ8VhDEUHNN
 uK1uhVkrj3wfnk2sQmAZXcpRNs6aP2BiAJYa2RjZTZ/uxF5OXjZ2tHmCHqGTKpAhVrbH+1C5LkP
 JSur470XUJqfTKDZjSWHWwL9BWdlOixz2NHSqy+WNrNthn9Z7btsRoW4D/uAqKBbpTAwVY814SS
 NgYrbLCYQHmhQoQ+yyfe9eGoRt/KvJsQjzBWgCFrpfwDck9BNNgajgn+SyzhHMGmv/3EoqTrVz9
 cuUm6yEBtMHAK+fntO+Oqqxutac2twzkUwTzUTzUCjY7xGERU98kUpaMfbdNofkh3RcaNQcdjWq
 HzgF4Z32BQOS+8myPqofbt71nUGiFn/y3AVEkO3SY1DNjD6sN8EXJzItc8TLdBhaa6JvcZsiq+q
 PPW4dl5Y
X-Proofpoint-GUID: djbAwuwWEMEYiyga7aOogfDIAkFb4smW

On 18 Sep 2025, Eugene Loh uttered the following:

> Okay, but should it even be $dtrace $dt_flags?=C2=A0 If for no other reas=
on than symmetry with prov1.d?

... I guess so. Missed that. Can fix if you like.

--=20
NULL && (void)
